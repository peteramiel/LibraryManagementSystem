package plm.librarymanagementsystem;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.design.widget.TextInputLayout;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class SignupActivity extends BaseActivity implements View.OnClickListener {
    private EditText emailEditText;
    private EditText passwordEditText;
    private EditText retypePasswordEditText;
    private EditText userNameEditText;
    private EditText userNumberEditText;
    private EditText contactNumberEditText;
    private EditText userProgramEditText;
    private TextInputLayout emailWrapper;
    private TextInputLayout passwordWrapper;
    private TextInputLayout userNameWrapper;
    private TextInputLayout retypePasswordWrapper;
    private TextInputLayout userNumberWrapper;
    private TextInputLayout contactNumberWrapper;
    private TextInputLayout userProgramWrapper;
    private Spinner userTypeSpinner;
    private FirebaseAuth mAuth;
    private String userId;
    private StorageReference mStorageRef;
    private String TAG = "SignUpActivity";
    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);
        //VIEWS;
        userNameEditText = findViewById(R.id.userNameSignUpEditText);
        emailEditText = findViewById(R.id.emailSignUpEditText);
        passwordEditText = findViewById(R.id.passwordSignUpEditText);
        retypePasswordEditText = findViewById(R.id.retypePasswordSignUpEditText);
        userNumberEditText =  findViewById(R.id.userNumberSignUpEditText);
        contactNumberEditText = findViewById(R.id.contactNumberSignUpEditText);
        userProgramEditText = findViewById(R.id.userProgramSignUpEditText);
        userNumberWrapper = findViewById(R.id.userNumberSignUpWrapper);
        contactNumberWrapper = findViewById(R.id.contactNumberSignUpWrapper);
        userProgramWrapper = findViewById(R.id.userProgramSignUpWrapper);
        userNameWrapper = findViewById(R.id.userNameSignUpWrapper);
        emailWrapper = findViewById(R.id.emailSignUpWrapper);
        passwordWrapper = findViewById(R.id.passwordSignUpWrapper);
        retypePasswordWrapper = findViewById(R.id.retypePasswordSignUpWrapper);

        userTypeSpinner = findViewById(R.id.userTypeSignupSpinner);

        //BUTTONS
        findViewById(R.id.signUpSignUpButton).setOnClickListener(this);
        findViewById(R.id.backSignUpButton).setOnClickListener(this);
        //VARIABLES
        mAuth = FirebaseAuth.getInstance();

    }

    //VALIDATING FORM
    private boolean validateForm() {
        boolean valid = true;

        String userType = String.valueOf(userTypeSpinner.getSelectedItem());
        if (TextUtils.isEmpty(userType) || userType.equals(R.string.user_type_prompt)){
            Toast.makeText(getApplicationContext(), "Invalid User Type", Toast.LENGTH_SHORT).show();
        }
        String email = emailEditText.getText().toString();
        if (TextUtils.isEmpty(email)) {
            emailWrapper.setError("Required");
            valid = false;
        } else {
            emailWrapper.setError(null);
        }
        String name = userNameEditText.getText().toString();
        if (TextUtils.isEmpty(name)) {
            userNameWrapper.setError("Required");
            valid = false;
        } else {
            userNameWrapper.setError(null);
        }
        String retypePassword = retypePasswordEditText.getText().toString();
        if (TextUtils.isEmpty(retypePassword)) {
            retypePasswordWrapper.setError("Required");
            valid = false;
        } else {
            retypePasswordWrapper.setError(null);
        }
        String password = passwordEditText.getText().toString();
        if (TextUtils.isEmpty(password)) {
            passwordWrapper.setError("Required");
            valid = false;
        } else {
            passwordWrapper.setError(null);
        }

        if (!password.equals(retypePassword)) {
            retypePasswordWrapper.setError("Passwords do not match. Please enter your desired password again");
            valid = false;
        }

        String userNumber = userNumberEditText.getText().toString();
        if (TextUtils.isEmpty(userNumber)) {
            userNumberWrapper.setError("Required");
            valid = false;
        } else {
            userNumberWrapper.setError(null);
        }

        String contactNumber = contactNumberEditText.getText().toString();
        if (TextUtils.isEmpty(contactNumber)) {
            contactNumberWrapper.setError("Required");
            valid = false;
        } else {
            contactNumberWrapper.setError(null);
        }

        String userProgram = userProgramEditText.getText().toString();
        if (TextUtils.isEmpty(userProgram)) {
            userProgramWrapper.setError("Required");
            valid = false;
        } else {
            userProgramWrapper.setError(null);
        }

        return valid;
    }
    //END OF VALIDATING FORM


    //CREATING NEW ACCOUNT
    public void createAccount(String email, String password) {
        if (!validateForm()) {
            return;
        }
        showProgressDialog();
        mAuth.createUserWithEmailAndPassword(email, password)
                .addOnCompleteListener(SignupActivity.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if (task.isSuccessful()) {
                            // Sign in success, update UI with the signed-in user's information
                            FirebaseUser currentUser = mAuth.getCurrentUser();
                            userId = currentUser.getUid();
                            mStorageRef = FirebaseStorage.getInstance().getReference();
                            Bitmap bm = BitmapFactory.decodeResource(getApplicationContext().getResources(), R.drawable.baseline_person_black_48dp);
                            Log.d(TAG,"Uploading Image");
                            File dir = new File(Environment.getExternalStorageDirectory() + File.separator + "drawable");
                            boolean doSave = true;
                            if (!dir.exists()) {
                                doSave = dir.mkdirs();
                            }

                            if (doSave) {
                                saveBitmapToFile(dir,"UserProfilePicture.png",bm,Bitmap.CompressFormat.PNG,100);
                            }
                            else {
                                Log.d(TAG,"Couldn't create target directory.");
                            }

                            Uri file = Uri.fromFile(new File(Environment.getExternalStorageDirectory() + File.separator + "drawable/UserProfilePicture.png"));

                            StorageReference userProfileRef = mStorageRef.child("User").child(userId);
                            UploadTask uploadTask = userProfileRef.putFile(file);

// Register observers to listen for when the download is done or if it fails
                            uploadTask.addOnFailureListener(new OnFailureListener() {
                                @Override
                                public void onFailure(@NonNull Exception exception) {
                                    // Handle unsuccessful uploads
                                }
                            }).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
                                @Override
                                public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                                    // taskSnapshot.getMetadata() contains file metadata such as size, content-type, etc.
                                    // ...
                                }
                            });
                            Log.d(TAG,"Setting up account");
                            DatabaseReference myRef = FirebaseDatabase.getInstance().getReference("User");
                            String userName = userNameEditText.getText().toString();
                            String userType = String.valueOf(userTypeSpinner.getSelectedItem());
                            String userNumber = userNumberEditText.getText().toString();
                            String userProgram = userProgramEditText.getText().toString();
                            String contactNumber = contactNumberEditText.getText().toString();
                            User user = new User(userName,userType,userNumber,userProgram,contactNumber);
                            myRef.child(userId).setValue(user);

                            //Send Email Verification
                            currentUser.sendEmailVerification().
                                    addOnCompleteListener(new OnCompleteListener<Void>() {
                                        @Override
                                        public void onComplete(@NonNull Task<Void> task) {
                                            if (task.isSuccessful()) {
                                                Log.d(TAG,"Email Verification Sent!");
                                                startActivity(new Intent(SignupActivity.this,VerifyEmailActivity.class));
                                                finish();
                                            }
                                            }
                                    }
                            );
                        } else {
                            // If sign in fails, display a message to the user.

                            Toast.makeText(SignupActivity.this, "Authentication failed.",
                                    Toast.LENGTH_SHORT).show();

                        }
                        hideProgressDialog();

                    }
                });
    }
    //END OF CREATING NEW ACCOUNT

    boolean saveBitmapToFile(File dir, String fileName, Bitmap bm,
                             Bitmap.CompressFormat format, int quality) {

        File imageFile = new File(dir,fileName);

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(imageFile);

            bm.compress(format,quality,fos);

            fos.close();

            return true;
        }
        catch (IOException e) {
            Log.e("app",e.getMessage());
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
        return false;
    }

    //Go back
    private void goBack(){
        startActivity(new Intent(SignupActivity.this,LoginActivity.class));
        finish();
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if (i == R.id.signUpSignUpButton) {
            createAccount(emailEditText.getText().toString(), passwordEditText.getText().toString());
        }else if(i== R.id.backSignUpButton){
            goBack();
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        goBack();
    }
}

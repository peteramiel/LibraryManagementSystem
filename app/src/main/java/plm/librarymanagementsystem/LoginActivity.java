package plm.librarymanagementsystem;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.TextInputLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class LoginActivity extends BaseActivity implements View.OnClickListener {
    private static final String TAG ="LoginActivity";
    private EditText mEmailEditText;
    private EditText mPasswordEditText;
    private TextInputLayout emailWrapper;
    private TextInputLayout passwordWrapper;
    private FirebaseAuth mAuth;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        //VIEWS
        mEmailEditText = findViewById(R.id.emailEditText);
        mPasswordEditText = findViewById(R.id.passwordEditText);
        emailWrapper = findViewById(R.id.emailLoginWrapper);
        passwordWrapper = findViewById(R.id.passwordLoginWrapper);
        emailWrapper.setHint("Email");
        passwordWrapper.setHint("Password");
        //BUTTONS
        findViewById(R.id.loginButton).setOnClickListener(this);
        findViewById(R.id.goSignUpButton).setOnClickListener(this);
        findViewById(R.id.forgotPasswordButton).setOnClickListener(this);

        //FIREBASE AUTH
        mAuth = FirebaseAuth.getInstance();

    }

    @Override
    protected void onStart() {
        super.onStart();
        FirebaseUser currentUser = mAuth.getCurrentUser();
        Log.d(TAG,"OnStartUser: "+currentUser);
        if(currentUser==null){

        }else{
            signInSuccessful();
        }
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if(i==R.id.loginButton){
            logIn(mEmailEditText.getText().toString(),mPasswordEditText.getText().toString());
        }else if(i==R.id.goSignUpButton){
            signUp();
        }else if(i==R.id.forgotPasswordButton){
            forgotPassword();
        }
    }

    private void logIn(final String email, String password){
        showProgressDialog();
        if(!validateForm()){
            return;
        }
        mAuth.signInWithEmailAndPassword(email,password).addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if(task.isSuccessful()){
                    Log.d(TAG, "signInWithEmail:success");
                    FirebaseUser user = mAuth.getCurrentUser();

                    //Check if user is verified
                    if(!user.isEmailVerified()){
                        mAuth.signOut();
                        hideProgressDialog();
                        Toast.makeText(getApplicationContext(), "Email Not Verified", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    signInSuccessful();

                }else{
                    Log.d(TAG, "signInWithEmail:failed");
                    Toast.makeText(LoginActivity.this,"Login Failed!",Toast.LENGTH_SHORT).show();
                    emailWrapper.setError("Wrong Email and Password");
                    passwordWrapper.setError("Wrong Email and Password");
                }
                hideProgressDialog();
            }
        });
    }

    private void signInSuccessful(){
        startActivity(new Intent(LoginActivity.this,HomeActivity.class));
        finish();
    }
    private void signUp(){
        startActivity(new Intent(LoginActivity.this,SignupActivity.class));
        finish();
    }
    private void forgotPassword(){
        startActivity(new Intent(LoginActivity.this,ForgotPasswordActivity.class));
        finish();
    }
    private boolean validateForm() {
        boolean valid = true;

        String email = mEmailEditText.getText().toString();
        if (TextUtils.isEmpty(email)) {
            emailWrapper.setError("Required");
            valid = false;
        } else {
            emailWrapper.setError(null);
        }

        String password = mPasswordEditText.getText().toString();
        if (TextUtils.isEmpty(password)) {
            passwordWrapper.setError("Required");
            valid = false;
        } else {
            passwordWrapper.setError(null);
        }

        return valid;
    }

}

package plm.librarymanagementsystem;

import android.content.Intent;
import android.net.Uri;
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

public class ForgotPasswordActivity extends BaseActivity implements View.OnClickListener {
    private EditText mEmail;
    private EditText mUserName;
    private FirebaseAuth mAuth;
    private String email;
    private String TAG = "ForgotPasswordActivity";
    private TextInputLayout mEmailWrapper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_forgot_password);
        findViewById(R.id.backForgotPasswordButton).setOnClickListener(this);
        findViewById(R.id.submitForgotPasswordButton).setOnClickListener(this);
        mEmailWrapper = findViewById(R.id.emailForgotPasswordWrapper);
        mEmail = findViewById(R.id.emailForgotPasswordEditText);
        mAuth = FirebaseAuth.getInstance();
    }

    private boolean validateForm(){
        boolean valid = true;

        String email = mEmail.getText().toString();
        if (TextUtils.isEmpty(email)) {
            mEmailWrapper.setError("Required");
            valid = false;
        } else {
            mEmailWrapper.setError(null);
        }
        return valid;

    }
    private void goBack(){
        startActivity(new Intent(ForgotPasswordActivity.this,LoginActivity.class));
        finish();
    }


    private void sendEmail(){
        if(!validateForm()){
            return;
        }

        email = mEmail.getText().toString();
        mAuth.sendPasswordResetEmail(email).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
                if(task.isSuccessful()){
                    Log.d(TAG,"Email Reset Sent!");
                    Toast.makeText(getApplicationContext(),"Email Reset Sent.",Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(ForgotPasswordActivity.this,LoginActivity.class));
                    finish();
                }else{
                    Log.d(TAG,"Email Not Sent!");
                    Toast.makeText(getApplicationContext(),"Oops! Something went wrong. Please try again.",Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        goBack();
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if(i==R.id.backForgotPasswordButton){
           goBack();
        }else if(i==R.id.submitForgotPasswordButton){
            sendEmail();
        }
    }
}

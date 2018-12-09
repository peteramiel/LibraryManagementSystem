package plm.librarymanagementsystem;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.google.firebase.auth.FirebaseAuth;

public class VerifyEmailActivity extends AppCompatActivity implements View.OnClickListener{
    private FirebaseAuth mAuth;
    private TextView mEmail;

    private String userEmail;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verify_email);
        findViewById(R.id.backVerifyEmailButton).setOnClickListener(this);
        mAuth= FirebaseAuth.getInstance();
        mEmail = findViewById(R.id.emailVerifyEmailTextView);
    }

    @Override
    protected void onStart() {
        super.onStart();
        if(mAuth.getCurrentUser()==null) {
            userEmail = "";
        }else{
            userEmail = mAuth.getCurrentUser().getEmail();
        }
        mEmail.setText(userEmail);
    }

    private void goBack(){
        mAuth.signOut();
        startActivity(new Intent(VerifyEmailActivity.this,LoginActivity.class));
        finish();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        goBack();
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if (i == R.id.backVerifyEmailButton){
            goBack();
        }
    }
}

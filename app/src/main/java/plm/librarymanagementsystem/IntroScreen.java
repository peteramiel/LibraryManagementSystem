package plm.librarymanagementsystem;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class IntroScreen extends AppCompatActivity {
    private static int INTRO_SCREEN_TIME_OUT = 2000;
    private String TAG = "IntroScreen";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_intro_screen);
        Log.d(TAG, "Starting Delay");
        new Handler().postDelayed(new Runnable(){
            @Override
            public void run(){
                Intent loginUser = new Intent (IntroScreen.this, LoginActivity.class);
                Log.d(TAG, "Starting Starting Activity");
                startActivity(loginUser);
                finish();
            }
        },INTRO_SCREEN_TIME_OUT);
    }

}


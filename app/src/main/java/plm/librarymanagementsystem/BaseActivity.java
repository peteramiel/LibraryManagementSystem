package plm.librarymanagementsystem;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.google.firebase.auth.FirebaseAuth;

import java.util.Objects;

public class BaseActivity extends AppCompatActivity {
    public ProgressDialog mProgressDialog;
    public FirebaseAuth mAuth;
    public Dialog popupNoInternet;

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //CREATE POPUP FOR NO INTERNET CONNECTION
        popupNoInternet = new Dialog(this);
        popupNoInternet.setContentView(R.layout.popup_no_internet);
        Button retryConnectionButton = popupNoInternet.findViewById(R.id.retryConnectionButton);
        retryConnectionButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                checkInternetConnection();
            }
        });

        if(!checkInternetConnection()){
            showNoInternetPopup();
        }
    }


    public void showProgressDialog() {
        if (mProgressDialog == null) {
            mProgressDialog = new ProgressDialog(this);
            mProgressDialog.setMessage(getString(R.string.loading));
            mProgressDialog.setIndeterminate(true);
        }

        mProgressDialog.show();
    }
    public void hideProgressDialog() {
        if (mProgressDialog != null && mProgressDialog.isShowing()) {
            mProgressDialog.dismiss();
        }
    }

    public boolean checkInternetConnection(){
        boolean connected =false;
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        if(connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE).getState() == NetworkInfo.State.CONNECTED
                || connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI).getState() == NetworkInfo.State.CONNECTED ){
            connected = true;
            popupNoInternet.dismiss();
        }else{
            connected = false;
        }
        return connected;
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    public void showNoInternetPopup(){
        Objects.requireNonNull(popupNoInternet.getWindow()).setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        popupNoInternet.show();
    }



}

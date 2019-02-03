package plm.librarymanagementsystem;

import android.content.Intent;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProfileActivity extends BaseActivity implements View.OnClickListener {
    /*
     FirebaseUser user = mAuth.getCurrentUser();
            String userId = user.getUid();
            DatabaseReference myRef = FirebaseDatabase.getInstance().getReference("users");
            myRef.child(userId).child("routes").child(routeName).child("stops").child(newStopName).child("lat").setValue(latLng.latitude);
            myRef.child(userId).child("routes").child(routeName).child("stops").child(newStopName).child("long").setValue(latLng.longitude);
            myRef.child(userId).child("routes").child(routeName).child("stops").child(newStopName).child("name").setValue(newStopName);

    */
    FirebaseAuth mAuth;
    private String TAG = "ProfileActivity";
    TextView userNameTextView;
    TextView userTypeTextView;
    TextView userNumberTextView;
    TextView userProgramTextView;
    TextView contactNumberTextView;

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        Log.d(TAG, "Activity Created");
        final ListView borrowedBooks = findViewById(R.id.borrowedBooksProfileListView);
        final ListView unreturnedBooks = findViewById(R.id.unreturnedBooksProfileListView);
        String[] borrowed = new String[]{"Book 1, Book 2"};
        String[] unreturned = new String[]{"None"};
        userNameTextView = findViewById(R.id.userNameProfileTextView);
        userTypeTextView = findViewById(R.id.userTypeProfileTextView);
        userNumberTextView = findViewById(R.id.userNumberProfileTextView);
        userProgramTextView = findViewById(R.id.userProgramProfileTextView);
        contactNumberTextView = findViewById(R.id.userContactProfileTextView);

        final List<String> borrowedList = new ArrayList<>(Arrays.asList(borrowed));
        final List<String> unreturnedList = new ArrayList<>(Arrays.asList(unreturned));
        final ArrayAdapter<String> arrayAdapterBorrowed = new ArrayAdapter<String>(this, R.layout.simple_list_for_books_1, borrowedList);
        final ArrayAdapter<String> arrayAdapterUnreturned = new ArrayAdapter<String>(this, R.layout.simple_list_for_books_1, unreturnedList);
        borrowedBooks.setAdapter(arrayAdapterBorrowed);
        unreturnedBooks.setAdapter(arrayAdapterUnreturned);
        findViewById(R.id.logoutProfileButton).setOnClickListener(this);
//        getUserData();
    }

//    private void getUserData() {
//        mAuth = FirebaseAuth.getInstance();
//        FirebaseUser user = mAuth.getCurrentUser();
//        String userID = user.getUid().toString();
//        DatabaseReference myRef = FirebaseDatabase.getInstance().getReference().child("User").child(userID);
//
//        // Attach a listener to read the data at our posts reference
//        myRef.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(DataSnapshot dataSnapshot) {
//                User user = dataSnapshot.getValue(User.class);
//                userNameTextView.setText(user.getUserName());
//                userTypeTextView.setText(user.getUserType());
//                userProgramTextView.setText(user.getUserProgram());
//                userNumberTextView.setText(user.getUserNumber());
//                contactNumberTextView.setText(user.getContactNumber());
//
//            }
//
//            @Override
//            public void onCancelled(DatabaseError databaseError) {
//                System.out.println("The read failed: " + databaseError.getCode());
//            }
//        });
//    }

    private void logout() {
        showProgressDialog();
        mAuth.signOut();
        Log.d(TAG, "Signed Out");
        startActivity(new Intent(ProfileActivity.this, LoginActivity.class));
        Log.d(TAG, "Starting Activity");
        hideProgressDialog();
        finish();
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if (i == R.id.logoutProfileButton) {
            logout();
        }
    }
}

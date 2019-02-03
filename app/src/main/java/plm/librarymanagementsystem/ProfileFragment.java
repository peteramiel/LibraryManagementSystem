package plm.librarymanagementsystem;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.NavigationView;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class ProfileFragment extends Fragment implements View.OnClickListener {
    private TextView mUserNameTextView;
    private TextView mUserTypeTextView;
    private TextView mUserNumberTextView;
    private TextView mContactNumberTextView;
    private TextView mUserProgramTextView;

    private String TAG = "ProfileFragment";
    private FirebaseAuth mAuth;
    private static String userId;
    private String URL_USERS;


/*
StorageReference storageReference = = FirebaseStorage.getInstance().getReference().child("myimage");


ImageView image = (ImageView)findViewById(R.id.imageView);

// Load the image using Glide
Glide.with(this  context )
            .using(new FirebaseImageLoader())
            .load(storageReference)
        .into(image );
*/

    public ProfileFragment() {
        // Required empty public constructor
    }

//    private void getUserInformation() {
//        DatabaseReference myRef = FirebaseDatabase.getInstance().getReference("User").child(userId);
//        // Attach a listener to read the data at our posts reference
//        myRef.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(DataSnapshot dataSnapshot) {
//                User user = dataSnapshot.getValue(User.class);
//                mUserNameTextView.setText(user.getUserName());
//                mUserTypeTextView.setText(user.getUserType());
//                mUserProgramTextView.setText(user.getUserProgram());
//                mUserNumberTextView.setText(user.getUserNumber());
//                mContactNumberTextView.setText(user.getContactNumber());
//
//            }
//
//            @Override
//            public void onCancelled(DatabaseError databaseError) {
//                System.out.println("The read failed: " + databaseError.getCode());
//            }
//        });
//
//    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        mAuth = FirebaseAuth.getInstance();
        FirebaseUser user = mAuth.getCurrentUser();


        if (user != null) {
            userId = user.getUid();
        }else{
            logout();
        }


        return inflater.inflate(R.layout.fragment_profile, container, false);

    }

    private void getUserFromServer(){

        URL_USERS = "http://"+getResources().getString(R.string.SERVER_IP)+"/WebLibrarySystem/mobile_find_user.php?user="+userId;
        Log.d(TAG,URL_USERS);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, URL_USERS, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    JSONArray array= new JSONArray(response);


                        //getting product object from json array
                        JSONObject userArray = array.getJSONObject(0);

                        //adding the product to product list
                      User user = new User(

                                userArray.getString("Name"),
                                userArray.getString("UserId"),
                                userArray.getString("StudentNumber"),
                                userArray.getString("UserPic"),
                                userArray.getString("Course"),
                                userArray.getString("College"),
                                userArray.getString("YearLevel"),
                                userArray.getString("Email"),
                                userArray.getString("ContactNumber"),
                                userArray.getString("UserType")
                      );

                    mUserNameTextView.setText(user.getName());
                    mUserTypeTextView.setText(user.getUserType());
                    mUserProgramTextView.setText(user.getCourse());
                    mUserNumberTextView.setText(user.getStudentNumber());
                    mContactNumberTextView.setText(user.getContactNumber());
                    ImageView profilePicture = (ImageView) getView().findViewById(R.id.pictureProfileImageView);
                    GlideApp.with(profilePicture.getContext())
                            .load("http://"+getResources().getString(R.string.SERVER_IP)+"/WebLibrarySystem/images/users/"+user.getUserPic())
                            .override(300, 200)
                            .into(profilePicture);
                }catch (JSONException e){
                    e.printStackTrace();
                    Log.d(TAG,e.toString());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d(TAG,"Cant Connect to server");
                Log.d(TAG,error.toString());


            }
        });

        Volley.newRequestQueue(getActivity().getBaseContext()).add(stringRequest);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        mUserNameTextView = view.findViewById(R.id.userNameProfileTextView);
        mUserTypeTextView = view.findViewById(R.id.userTypeProfileTextView);
        mUserNumberTextView = view.findViewById(R.id.userNumberProfileTextView);
        mUserProgramTextView = view.findViewById(R.id.userProgramProfileTextView);
        mContactNumberTextView = view.findViewById(R.id.contactNumberProfileTextView);
        view.findViewById(R.id.logoutProfileButton).setOnClickListener(this);


//        final StorageReference storageReference = FirebaseStorage.getInstance().getReference("User").child(userId);




// Load the image using Glide

        final ListView borrowedBooks = view.findViewById(R.id.borrowedBooksProfileListView);
        final ListView unreturnedBooks = view.findViewById(R.id.unreturnedBooksProfileListView);
        String[] borrowed = new String[]{"Book 1, Book 2"};
        String[] unreturned = new String[]{"None"};
        final List<String> borrowedList = new ArrayList<>(Arrays.asList(borrowed));
        final List<String> unreturnedList = new ArrayList<>(Arrays.asList(unreturned));
        final ArrayAdapter<String> arrayAdapterBorrowed = new ArrayAdapter<String>(getContext(), R.layout.simple_list_for_books_1, borrowedList);
        final ArrayAdapter<String> arrayAdapterUnreturned = new ArrayAdapter<String>(getContext(), R.layout.simple_list_for_books_1, unreturnedList);
        borrowedBooks.setAdapter(arrayAdapterBorrowed);
        unreturnedBooks.setAdapter(arrayAdapterUnreturned);

//        getUserInformation();
        getUserFromServer();
    }

    private void logout() {
        mAuth.signOut();
        Log.d(TAG, "Signed Out");
        startActivity(new Intent(getActivity(), LoginActivity.class));
        Log.d(TAG, "Starting Activity");
        getActivity().finish();
    }

    @Override
    public void onClick(View view) {
        int i = view.getId();
        if (i == R.id.logoutProfileButton) {
            logout();
        }
    }
}

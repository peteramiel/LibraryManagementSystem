package plm.librarymanagementsystem;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class NewsFragment extends Fragment {
    private RecyclerView newsRecyclerView;
    private NewsAdapter newsAdapter;
    private List<News> newsList = new ArrayList<>();
    private String TAG = "NewsFragment";
    private FirebaseAuth mAuth;
    private static String userId;

    public NewsFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        mAuth = FirebaseAuth.getInstance();
        FirebaseUser user = mAuth.getCurrentUser();
        userId = user.getUid();
        return inflater.inflate(R.layout.fragment_news, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Log.d(TAG, "onViewCreated:Creating View");
        prepareNewsData();
        newsRecyclerView = (RecyclerView) view.findViewById(R.id.newsNewsRecyclerView);
        newsAdapter = new NewsAdapter(newsList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getContext());
        newsRecyclerView.setLayoutManager(mLayoutManager);
        newsRecyclerView.setItemAnimator(new DefaultItemAnimator());
        newsRecyclerView.setAdapter(newsAdapter);

    }

    private void prepareNewsData() {
        newsList.clear();
        DatabaseReference myRef = FirebaseDatabase.getInstance().getReference("Admin").child("News");
        // Attach a listener to read the data at our posts reference
        myRef.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
//                    News news = dataSnapshot.getValue(News.class);
//                    newsList.add(news);
//                    Log.d(TAG,"prepareNewsData:adding news");
                for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
                    News news = postSnapshot.getValue(News.class);
                    newsList.add(news);
                }
                ImageView profilePicture = (ImageView) getView().findViewById(R.id.pictureNewsImageView);
                final StorageReference storageReference = FirebaseStorage.getInstance().getReference("User").child(userId);

                GlideApp.with(getContext())
                        .load(storageReference)
                        .override(300, 200)
                        .into(profilePicture);
                newsAdapter = new NewsAdapter(newsList);
                newsRecyclerView.setAdapter(newsAdapter);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                System.out.println("The read failed: " + databaseError.getCode());
            }
        });


    }

    private void example() {
        Log.d(TAG, "prepareNewsData:Preparing date");
        Date date = new Date();
        String strDateFormat = "hh:mm:ss a";
        DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
        String formattedDate = dateFormat.format(date);

        News news = new News("Hello World", "This human", formattedDate);
        newsList.add(news);
        news = new News("Another News", "Caption", formattedDate);
        newsList.add(news);
        newsAdapter.notifyDataSetChanged();
    }

}

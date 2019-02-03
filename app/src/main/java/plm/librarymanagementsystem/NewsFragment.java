package plm.librarymanagementsystem;

import android.app.Fragment;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.view.menu.MenuView;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class NewsFragment extends Fragment {
    private RecyclerView newsRecyclerView;

    private NewsAdapter newsAdapter;
    private List<News> newsList = new ArrayList<>();
    private String TAG = "NewsFragment";
    private FirebaseAuth mAuth;
    private static String userId;
    private ImageView profilePic;
    private String URL_search_page;


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

        newsRecyclerView = view.findViewById(R.id.newsNewsRecyclerView);
        newsAdapter = new NewsAdapter(getContext(),newsList);
        prepareNewsData();


    }

    private void prepareNewsData() {

        Log.d(TAG, "prepareNewsData():Getting News Data");
        URL_search_page = "http://"+getResources().getString(R.string.SERVER_IP)+"/WebLibrarySystem/mobile_announcements.php";
        StringRequest stringRequest = new StringRequest(Request.Method.GET, URL_search_page, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{

                    List<News> newsList= new ArrayList<News>();
                    JSONArray array= new JSONArray(response);

                    for(int i =0; i<array.length();i++){
                        //getting product object from json array
                        JSONObject newsArray = array.getJSONObject(i);
                        Log.d(TAG, "onResponse:content"+newsArray.getString("content"));
                        News news = new News(
                                newsArray.getString("content"),
                                newsArray.getString("attachment"),
                                newsArray.getString("dateTime")
                        );


                        newsList.add(news);

                    }
                    newsAdapter.notifyDataSetChanged();
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




}

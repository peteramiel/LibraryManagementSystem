package plm.librarymanagementsystem;


import android.os.Bundle;
import android.provider.ContactsContract;
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
import android.widget.ArrayAdapter;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.firebase.database.ChildEventListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 */
public class HomeFragment extends Fragment {
    ExpandableListView sectionListView;

    private SectionAdapter sectionAdapter;
    private String TAG = "HOME FRAGMENT";


    private String URL_search_page;
//    DatabaseReference searchPageRef= FirebaseDatabase.getInstance().getReference("Admin/SearchPage");
    public HomeFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        return inflater.inflate(R.layout.fragment_home, container, false);


    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Log.d(TAG, "OnCreate:sectionListView");
        sectionListView = (ExpandableListView) view.findViewById(R.id.sectionHomeExpandableListView);
        Log.d(TAG, "OnCreate:preparing Data");
        data();



    }

    private void data() {


        URL_search_page = "http://"+getResources().getString(R.string.SERVER_IP)+"/WebLibrarySystem/mobile_search_page.php";
        StringRequest stringRequest = new StringRequest(Request.Method.GET, URL_search_page, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try{
                    List<Books> bookList= new ArrayList<Books>();
                    List<Section> sectionList = new ArrayList<Section>();

                    JSONArray array= new JSONArray(response);
                    String prev;

                    JSONObject firstBook = array.getJSONObject(0);
                    prev = firstBook.getString("sectionTitle");

                    for(int i =0; i<array.length();i++){
                        //getting product object from json array
                        JSONObject bookArray = array.getJSONObject(i);

                        if(prev.equals(bookArray.getString("sectionTitle"))){
                            Books books = new Books(
                                    bookArray.getString("available"),
                                    bookArray.getString("bookAuthor"),
                                    bookArray.getString("bookTitle"),
                                    bookArray.getString("callNumber"),
                                    bookArray.getString("location"),
                                    bookArray.getString("publishDate"),
                                    bookArray.getString("series"),
                                    bookArray.getString("uniqueId"),
                                    bookArray.getString("shelfPosition"),
                                    bookArray.getString("shelfLayer")
                            );
                            Log.d(TAG,"if "+bookArray.getString("sectionTitle"));

                            bookList.add(books);
                            Log.d(TAG,"if "+bookList.get(bookList.size()-1).getBookTitle());
                        }
                        //ELSE STORE IN THE BOOK LIST IN THAT SECTION LIST
                        else{
                            sectionList.add(new Section(prev,bookList));
                            Log.d(TAG,"else "+bookArray.getString("sectionTitle"));
                            bookList= new ArrayList<Books>();


                            Books books = new Books(
                                    bookArray.getString("available"),
                                    bookArray.getString("bookAuthor"),
                                    bookArray.getString("bookTitle"),
                                    bookArray.getString("callNumber"),
                                    bookArray.getString("location"),
                                    bookArray.getString("publishDate"),
                                    bookArray.getString("series"),
                                    bookArray.getString("uniqueId"),
                                    bookArray.getString("shelfPosition"),
                                    bookArray.getString("shelfLayer")
                            );
                            bookList.add(books);
                            Log.d(TAG,"else "+bookList.get(bookList.size()-1).getBookTitle());
                            prev = bookArray.getString("sectionTitle");
                        }
                    }
                    sectionList.add(new Section(prev,bookList));

                    sectionAdapter = new SectionAdapter(getContext(), sectionList);
                    sectionListView.setAdapter(sectionAdapter);
                    for (int i = 0; i < sectionAdapter.getGroupCount();i++)
                        sectionListView.expandGroup(i);
                    // sectionList.add(new Section(section name , book list))



//                    mUserNameTextView.setText(user.getName());
//                    mUserTypeTextView.setText(user.getUserType());
//                    mUserProgramTextView.setText(user.getCourse());
//                    mUserNumberTextView.setText(user.getStudentNumber());
//                    mContactNumberTextView.setText(user.getContactNumber());
//                    ImageView profilePicture = (ImageView) getView().findViewById(R.id.pictureProfileImageView);
//                    GlideApp.with(profilePicture.getContext())
//                            .load("http://"+getResources().getString(R.string.SERVER_IP)+"/WebLibrarySystem/images/users/"+user.getUserPic())
//                            .override(300, 200)
//                            .into(profilePicture);
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

//        final DatabaseReference myRef = FirebaseDatabase.getInstance()
//                .getReference("Admin/SearchPage");
//        Log.d(TAG, myRef.toString());

        // Books book
        // bookList.add(book)
        // sectionList.add(new Section(section name , book list))
        //sectionAdapter = new SectionAdapter(getContext(), sectionList);
        //sectionListView.setAdapter(sectionAdapter);
        //for (int i = 0; i < sectionAdapter.getGroupCount();i++)
        //      sectionListView.expandGroup(i)




//        final ValueEventListener sectionListener = new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//            List<Books> bookList= new ArrayList<Books>();
//            List<Section> sectionList = new ArrayList<Section>();
//            DataSnapshot notSectionSnapshot = dataSnapshot;
//            Iterable<DataSnapshot> sectionNames = notSectionSnapshot.getChildren();
//            for(DataSnapshot sectionSnapshots : sectionNames){
//                String sectionName= sectionSnapshots.getKey();
//                Iterable<DataSnapshot> bookNames = sectionSnapshots.getChildren();
//                for(DataSnapshot book:bookNames){
//                    Books books = book.getValue(Books.class);
//
//                    bookList.add(books);
//                    Log.d(TAG,books.toString());
//                }
//                sectionList.add(new Section(sectionName,bookList));
//                Log.d(TAG, sectionList.get(0).sectionTitle);
//            }
//                sectionAdapter = new SectionAdapter(getContext(), sectionList);
//                sectionListView.setAdapter(sectionAdapter);
//                for (int i = 0; i < sectionAdapter.getGroupCount(); i++)
//                    sectionListView.expandGroup(i);
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//
//        };





//        booksArrayList.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        sections.add(new Section("New",booksArrayList));
//        myRef.addListenerForSingleValueEvent(sectionListener);


//        sectionAdapter = new SectionAdapter(getContext(), sections);
//        sectionListView.setAdapter(sectionAdapter);
        


//        myRef.addChildEventListener(new ChildEventListener() {
//            @Override
//            public void onChildAdded(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//                final String sect = dataSnapshot.getKey();
//                DatabaseReference myRef2 = myRef.child(sect);
//
//            }
//
//            @Override
//            public void onChildChanged(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//            }
//
//            @Override
//            public void onChildRemoved(@NonNull DataSnapshot dataSnapshot) {
//
//            }
//
//            @Override
//            public void onChildMoved(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });


//        myRef.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//                Iterable<DataSnapshot> snapshotIterator = dataSnapshot.getChildren();
//                Iterator<DataSnapshot> iterator = snapshotIterator.iterator();
//
//                while (iterator.hasNext()) {
//                    DataSnapshot next = (DataSnapshot) iterator.next();
//                    for (DataSnapshot ds : dataSnapshot.getChildren()){
//                        Books books = ds.getValue(Books.class);
//                        Log.d(TAG, books.getBookAuthor());
//                        String sectionTitle = ds.getKey();
//                        Log.d(TAG, sectionTitle);
//                        booksArrayList.add(books);
//                        sections.add(new Section(sectionTitle,booksArrayList));
//                    }
//
////                    String match = (String) next.child("description").getValue();
//
//
//
//                }
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });

//        myRef.addChildEventListener(new ChildEventListener() {
//            @Override
//            public void onChildAdded(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//                for (final DataSnapshot sectionSnapshot : dataSnapshot.getChildren()) {
//
//                    String sectionTitle = sectionSnapshot.getKey();
//                    Log.d(TAG, sectionTitle);
//                    for(DataSnapshot booksSnapshot : sectionSnapshot.getChildren()){
//                        //loop 2 to go through all the child nodes of books node
//                        Log.d(TAG, sectionTitle);
//                        Books books = booksSnapshot.getValue(Books.class);
//                        booksArrayList.add(books);
//                    }
//                    sections.add(new Section(sectionTitle,booksArrayList));
//                    sectionAdapter.notify();
//                    Log.d(TAG,sections.get(0).sectionTitle);
//                }
//            }
//
//            @Override
//            public void onChildChanged(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//            }
//
//            @Override
//            public void onChildRemoved(@NonNull DataSnapshot dataSnapshot) {
//
//            }
//
//            @Override
//            public void onChildMoved(@NonNull DataSnapshot dataSnapshot, @Nullable String s) {
//
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });

//
//        myRef.addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) { //Loop 1 to go through sections
//                for (final DataSnapshot sectionSnapshot : dataSnapshot.getChildren()) {
//
//                    String sectionTitle = sectionSnapshot.getKey();
//                    for(DataSnapshot booksSnapshot : sectionSnapshot.getChildren()){
//                        //loop 2 to go through all the child nodes of books node
//                        Log.d(TAG, sectionTitle);
//                        GenericTypeIndicator<Books> t = new GenericTypeIndicator<Books>() {};
//                        Books books = booksSnapshot.getValue(t);
//                        booksArrayList.add(books);
//                    }
//                    sections.add(new Section(sectionTitle,booksArrayList));
//                    Log.d(TAG,sections.get(0).sectionTitle);
//                }
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });
//        List<Books> newlyAcquired = new ArrayList<Books>();
//        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                        "1-A", "Oct 2018","LightYears","10"));
//        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        Section oneplus = new Section("New Arrivals", newlyAcquired);
//
//        List<Books> favorites = new ArrayList<Books>();
//        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10"));
//        Section nexus = new Section("Favorites",favorites);
//
//        sections.add(oneplus);
//        sections.add(nexus);
//        Books book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        sections.add(new Section("New",booksArrayList));
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        booksArrayList.add(book);
//        sections.add(new Section("New",booksArrayList));
    }
}

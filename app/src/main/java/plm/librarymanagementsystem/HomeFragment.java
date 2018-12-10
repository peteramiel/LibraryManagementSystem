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
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 */
public class HomeFragment extends Fragment {
    ExpandableListView sectionListView;
    private ArrayList<Section> sections = new ArrayList<Section>();
    private SectionAdapter sectionAdapter;
    private String TAG = "HOME FRAGMENT";

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
        Log.d(TAG,"OnCreate:sectionListView");
        sectionListView = (ExpandableListView) view.findViewById(R.id.sectionHomeExpandableListView);
        Log.d(TAG,"OnCreate:preparing Data");
        data();
        Log.d(TAG,"OnCreate:setting Adapter");
        sectionAdapter = new SectionAdapter(getContext(), sections);
        sectionListView.setAdapter(sectionAdapter);
        for(int i=0; i < sectionAdapter.getGroupCount(); i++)
            sectionListView.expandGroup(i);
//        sectionListView.setOnGroupExpandListener(new ExpandableListView.OnGroupExpandListener() {
//            int previousGroup = -1;
//
//            @Override
//            public void onGroupExpand(int groupPosition) {
//                if ((previousGroup != -1) && (groupPosition != previousGroup)) {
//                    sectionListView.collapseGroup(previousGroup);
//                }
//                previousGroup = groupPosition;
//            }
//        });
    }

    private void data(){
        sections.clear();
        List<Books> newlyAcquired = new ArrayList<Books>();
        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
                        "1-A", "Oct 2018","LightYears","10"));
        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        newlyAcquired.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        Section oneplus = new Section("New Arrivals", newlyAcquired);

        List<Books> favorites = new ArrayList<Books>();
        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        favorites.add(new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10"));
        Section nexus = new Section("Favorites",favorites);

        sections.add(oneplus);
        sections.add(nexus);
//        Books book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        recommendBooksList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        recommendBooksList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        recommendBooksList.add(book);
//        book = new Books("123a","Out of the Box","Suzanne Dudley",
//                "1-A", "Oct 2018","LightYears","10");
//        recommendBooksList.add(book);

    }
}

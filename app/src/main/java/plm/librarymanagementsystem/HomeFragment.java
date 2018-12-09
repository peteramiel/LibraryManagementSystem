package plm.librarymanagementsystem;


import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 */
public class HomeFragment extends Fragment {
    private RecyclerView recyclerView;
    private List<Books> recommendBooksList = new ArrayList<>();
    private RecommendBooksAdapter mRecommendBooksAdapter;

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
        recyclerView = (RecyclerView) view.findViewById(R.id.displayBooksRecyclerView);
        mRecommendBooksAdapter = new RecommendBooksAdapter(recommendBooksList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getContext(),LinearLayoutManager.HORIZONTAL,false);
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(mRecommendBooksAdapter);

        prepareRecommendBooksData();
    }

    private void prepareRecommendBooksData(){
        Books book = new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10");
        recommendBooksList.add(book);
        book = new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10");
        recommendBooksList.add(book);
        book = new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10");
        recommendBooksList.add(book);
        book = new Books("123a","Out of the Box","Suzanne Dudley",
                "1-A", "Oct 2018","LightYears","10");
        recommendBooksList.add(book);
        mRecommendBooksAdapter.notifyDataSetChanged();
    }
}

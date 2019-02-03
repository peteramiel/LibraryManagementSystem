package plm.librarymanagementsystem;

import android.annotation.SuppressLint;
import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

public class BookSelectFragment extends Fragment {
    private Books book;
    private String TAG = "BookSelectFragment";
    private TextView bookTitleTextView;
    private TextView bookAuthorTextView;
    private TextView bookTitleTextView2;
    private TextView bookAuthorTextView2;
    private TextView callNumberTextView;
    private TextView locationTextView;
    private TextView seriesTextView;
    private TextView publishDateTextView;
    private TextView availableTextView;
    private ImageView bookImageView;

    @SuppressLint("ValidFragment")
    public BookSelectFragment(Books book) {
        this.book = book;
    }

    public BookSelectFragment() {
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_book_select, container, false);

    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        bookAuthorTextView = view.findViewById(R.id.bookAuthorSelectedTextView);
        bookAuthorTextView2 = view.findViewById(R.id.bookAuthorSelectedTextView2);
        bookTitleTextView = view.findViewById(R.id.bookTitleSelectedTextView);
        bookTitleTextView2 = view.findViewById(R.id.bookTitleSelectedTextView2);
        callNumberTextView = view.findViewById(R.id.callNumberBookSelectTextView);
        locationTextView = view.findViewById(R.id.locationBookSelectTextView);
        publishDateTextView = view.findViewById(R.id.publishDateBookSelectTextView);
        seriesTextView = view.findViewById(R.id.publishDateBookSelectTextView);
        availableTextView = view.findViewById(R.id.availableBookSelectTextView);
        bookImageView = view.findViewById(R.id.imageBookSelectImageView);
        bookAuthorTextView.setText(book.getBookAuthor());
        bookAuthorTextView2.setText(book.getBookAuthor());
        bookTitleTextView.setText(book.getBookTitle());
        bookTitleTextView2.setText(book.getBookTitle());
        callNumberTextView.setText(book.getCallNumber());
        locationTextView.setText(book.getLocation());
        publishDateTextView.setText(book.getPublishDate());
        seriesTextView.setText(book.getSeries());
        availableTextView.setText(book.getAvailable());
        String URL = getResources().getString(R.string.SERVER_IP);
        String URL_IMAGE= "http://"+URL+"/WebLibrarySystem/images/books/"+ book.getUniqueId();
        GlideApp.with(this)
                .load(URL_IMAGE)
                .into(bookImageView);


    }

    @Override
    public void onResume() {
        super.onResume();
        if (getView()==null){
            return;
        }else{
            getView().setFocusableInTouchMode(true);
            getView().requestFocus();
            getView().setOnKeyListener(new View.OnKeyListener() {
                @Override
                public boolean onKey(View v, int keyCode, KeyEvent event) {
                    if(event.getAction() == KeyEvent.ACTION_UP && keyCode == KeyEvent.KEYCODE_BACK){
                        ((HomeActivity) BookSelectFragment.this.getActivity()).setFragment(new HomeFragment());
                        return true;
                    }
                    return false;
                }
            });
        }
    }
}

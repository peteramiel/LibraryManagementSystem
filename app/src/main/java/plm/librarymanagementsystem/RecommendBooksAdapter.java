package plm.librarymanagementsystem;

import android.content.Context;
import android.media.Image;
import android.support.annotation.NonNull;
import android.support.v4.app.FragmentManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.util.List;

public class RecommendBooksAdapter extends RecyclerView.Adapter<RecommendBooksAdapter.MyViewHolder> {

    private Context context;
    private List<Books> booksList;
    private String IP_ADDRESS;

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View itemView = inflater.inflate(R.layout.book_item_home, null, false);
        MyViewHolder viewHolder = new MyViewHolder(itemView, viewGroup.getContext());
        viewHolder.image = (ImageView) itemView.findViewById(R.id.bookHomeImageView);
        viewHolder.title = (TextView) itemView.findViewById(R.id.bookTitleHomeTextView);
//        IP_ADDRESS= context.getResources().getString(R.string.SERVER_IP);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder myViewHolder, final int i) {
       Books book = booksList.get(i);
       IP_ADDRESS=context.getResources().getString(R.string.SERVER_IP);
       String URL_IMAGE= "http://"+IP_ADDRESS+"/WebLibrarySystem/images/books/"+ booksList.get(i).getUniqueId();
       GlideApp.with(myViewHolder.image.getContext())
               .load(URL_IMAGE)
               .into(myViewHolder.image);

        myViewHolder.title.setText(String.format("%s by %s", booksList.get(i).getBookTitle(), booksList.get(i).getBookAuthor()));

        myViewHolder.image.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((HomeActivity) RecommendBooksAdapter.this.context).setFragment(new BookSelectFragment(booksList.get(i)));
            }
        });
        myViewHolder.title.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((HomeActivity) RecommendBooksAdapter.this.context).setFragment(new BookSelectFragment(booksList.get(i)));
            }
        });
    }

    @Override
    public int getItemCount() {
        return booksList.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView title;
        public ImageView image;
        Context context;

        public MyViewHolder(View view,Context fm) {
            super(view);
            image = view.findViewById(R.id.imageBookListRow);
            title = (TextView) view.findViewById(R.id.titleBookListRow);
            context= fm;
        }
    }

    public RecommendBooksAdapter(Context context, List<Books> booksList) {
        this.context = context;
        this.booksList = booksList;

    }


}

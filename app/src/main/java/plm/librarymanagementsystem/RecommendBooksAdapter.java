package plm.librarymanagementsystem;

import android.content.Context;
import android.media.Image;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class RecommendBooksAdapter extends RecyclerView.Adapter<RecommendBooksAdapter.MyViewHolder>{

    private Context context;
    private List<Books> booksList;

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View itemView = inflater.inflate(R.layout.book_item_home, null, false);
        MyViewHolder viewHolder = new MyViewHolder(itemView);
        viewHolder.image = (ImageView) itemView.findViewById(R.id.bookHomeImageView);
        viewHolder.title = (TextView) itemView.findViewById(R.id.bookTitleHomeTextView);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder myViewHolder, int i) {
        ImageView bookImageView = (ImageView) myViewHolder.image;
        bookImageView.setImageResource(R.drawable.sample_book);
        myViewHolder.title.setText(String.format("%s by %s", booksList.get(i).getBookTitle(), booksList.get(i).getBookAuthor()));

    }

    @Override
    public int getItemCount() {
        return booksList.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView title;
        public ImageView image;

        public MyViewHolder(View view) {
            super(view);
            image = view.findViewById(R.id.imageBookListRow);
            title = (TextView) view.findViewById(R.id.titleBookListRow);
        }
    }

    public RecommendBooksAdapter(Context context,List<Books> booksList) {
        this.context = context;
        this.booksList = booksList;
    }


}

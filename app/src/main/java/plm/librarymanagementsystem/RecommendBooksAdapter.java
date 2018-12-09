package plm.librarymanagementsystem;

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
    private List<Books> booksList;

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View itemView = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.recommend_book_list_row, viewGroup, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder myViewHolder, int i) {
        Books book = booksList.get(i);
        myViewHolder.title.setText(String.format("%s by %s", book.getBookTitle(), book.getBookAuthor()));
        myViewHolder.image.setImageResource(R.drawable.baseline_bookmarks_white_24dp);
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

    public RecommendBooksAdapter(List<Books> booksList) {
        this.booksList = booksList;
    }


}

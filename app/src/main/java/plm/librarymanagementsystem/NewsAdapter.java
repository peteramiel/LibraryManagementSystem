package plm.librarymanagementsystem;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class NewsAdapter extends RecyclerView.Adapter<NewsAdapter.MyNewsHolder>{
    public NewsAdapter(List<News> newsList) {
        this.newsList = newsList;
    }

    private List<News> newsList;
    @NonNull
    @Override
    public MyNewsHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View itemView = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.news_list_row, viewGroup, false);

        return new MyNewsHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull MyNewsHolder myNewsHolder, int i) {
        News news = newsList.get(i);
        myNewsHolder.content.setText(news.getAttachment());
        myNewsHolder.datePosted.setText(news.getDatePosted());
        myNewsHolder.attachment.setImageResource(R.drawable.no_image);
    }

    @Override
    public int getItemCount() {
        return newsList.size();
    }

    public class MyNewsHolder extends RecyclerView.ViewHolder {
        public TextView content;
        public ImageView attachment;
        public TextView datePosted;

        public MyNewsHolder(View view) {
            super(view);
            content = view.findViewById(R.id.contentNewsListRowTextView);
            attachment = view.findViewById(R.id.attachmentNewsListRowImageView);
            datePosted = view.findViewById(R.id.datePostedNewsListRowTextView);
        }
    }

}

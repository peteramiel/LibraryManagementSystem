package plm.librarymanagementsystem;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.List;

public class NewsAdapter extends RecyclerView.Adapter<NewsAdapter.MyNewsHolder>{
    public NewsAdapter(Context context,List<News> newsList) {
        this.context = context;
        this.newsList = newsList;
    }
    private String TAG = "NewsAdapter";
    private List<News> newsList;
    private Context context;


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
        myNewsHolder.content.setText(news.getContent());
        myNewsHolder.datePosted.setText(news.getDatePosted());
        String attachmentResource = news.getAttachment();
        Log.d(TAG, "onBindViewHolder:"+ news.getContent());
        String IP_ADDRESS=context.getResources().getString(R.string.SERVER_IP);
        String URL_IMAGE= "http://"+IP_ADDRESS+"/WebLibrarySystem/images/announcements/"+ attachmentResource;
        Log.d(TAG, "onViewCreated:"+ IP_ADDRESS);
        GlideApp.with(context)
                .load(URL_IMAGE)
                .override(300,200)
                .into(myNewsHolder.attachment);
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

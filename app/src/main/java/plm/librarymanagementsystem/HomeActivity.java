package plm.librarymanagementsystem;

import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.FrameLayout;
import android.widget.Switch;

public class HomeActivity extends AppCompatActivity {

    private BottomNavigationView mBottomNavigationView;
    private FrameLayout mFrameLayout;
    private Fragment newsFragment;
    private Fragment homeFragment;

    private Fragment profileFragment;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        mBottomNavigationView = findViewById(R.id.main_nav);
        mFrameLayout = findViewById(R.id.main_frame);
        newsFragment = new NewsFragment();
        homeFragment = new HomeFragment();
        profileFragment = new ProfileFragment();
        setFragment(newsFragment);

        mBottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.nav_home:
                        mBottomNavigationView.setItemBackgroundResource(R.color.colorPrimary);
                        setFragment(newsFragment);
                        return true;
                    case R.id.nav_search:
                        mBottomNavigationView.setItemBackgroundResource(R.color.colorAccent);
                        setFragment(homeFragment);
                        return true;
                    case R.id.nav_account:
                        mBottomNavigationView.setItemBackgroundResource(R.color.colorPrimaryDark);
                        setFragment(profileFragment);
                        return true;

                        default:
                            return false;
                }
            }
        });


    }
    public void setFragment(Fragment fragment){

        FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        fragmentTransaction.replace(R.id.main_frame,fragment);
        fragmentTransaction.commit();


    }
}

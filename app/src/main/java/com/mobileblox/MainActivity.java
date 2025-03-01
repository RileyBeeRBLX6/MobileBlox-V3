package com.mobileblox;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import com.mobileblox.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'mobileblox' library on application startup.
    static {
        try {
            System.loadLibrary("mobileblox");
        } catch (UnsatisfiedLinkError e) {
            e.printStackTrace();
        }
    }

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        binding.textView.setText(getNativeString());
    }

    public native String getNativeString();
}

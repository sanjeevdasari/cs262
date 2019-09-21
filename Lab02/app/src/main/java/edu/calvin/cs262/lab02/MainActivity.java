package edu.calvin.cs262.lab02;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    //keeps track of the number of times count was pressed
    private int mCount = 0;
    //keeps the TextView cast of mCount
    private TextView mShowCount;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mShowCount = (TextView) findViewById(R.id.show_count);
    }
    /**
     * Shows a toast message to user on-click of the "Toast" button
     *
     * @param  view Current Activity view
     * @return null.
     */
    public void showToast(View view) {
        Toast toast = Toast.makeText(this, R.string.toast_message, Toast.LENGTH_SHORT);
        toast.show();
    }
    /**
     * count the number of times "Count" button was pressed
     * and display its value as TextView
     *
     * @param  view Current Activity view
     * @return null.
     */
    public void countUp(View view) {
        mCount++;
        if (mShowCount != null)
            mShowCount.setText(Integer.toString(mCount));
    }
}

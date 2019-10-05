package edu.calvin.cs262.sd47;

import android.content.Context;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.support.v4.content.AsyncTaskLoader;


public class BookLoader extends AsyncTaskLoader<String> {

    private String mQueryString;

    BookLoader(Context context, String queryString) {
        super(context);
        mQueryString = queryString;
    }

    @Override
    protected void onStartLoading() {
        super.onStartLoading();

        forceLoad();
    }

    @Nullable
    @Override
    public String loadInBackground() {
        return NetworkUtils.getBookInfo(mQueryString);
    }
}

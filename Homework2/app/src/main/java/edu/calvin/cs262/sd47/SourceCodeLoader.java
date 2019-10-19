package edu.calvin.cs262.sd47;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.AsyncTaskLoader;

import edu.calvin.cs262.sd47.NetworkUtils;

public class SourceCodeLoader extends AsyncTaskLoader<String> {

    private String mQueryString;
    private String mTransferProtocol;
    Context mContext;

    public SourceCodeLoader(@NonNull Context context, String queryString, String transferProtocol) {
        super(context);
        mContext = context;
        mQueryString = queryString;
        mTransferProtocol = transferProtocol;
    }

    @Nullable
    @Override
    public String loadInBackground() {
        return NetworkUtils.getSourceCode(mContext, mQueryString, mTransferProtocol);
    }

    @Override
    protected void onStartLoading() {
        super.onStartLoading();
        forceLoad();
    }
}

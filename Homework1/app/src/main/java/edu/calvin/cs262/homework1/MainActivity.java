package edu.calvin.cs262.homework1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;

import android.widget.AdapterView;
import android.widget.ArrayAdapter;

import android.widget.EditText;
import android.widget.Spinner;

import android.widget.TextView;

// Sanjeev Dasari CS262

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {

    private EditText num1, num2;

    private Spinner operator;

    private TextView output;

    private String operatorSelection;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        num1 = findViewById(R.id.value1);

        num2 = findViewById(R.id.value2);

        output = findViewById(R.id.output_text);
        operator = findViewById(R.id.operation_spinner);
        operator.setOnItemSelectedListener(this);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.operation_spinner, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        operator.setAdapter(adapter);
    }

    public void calculate(View view)

    {

        if (num1.getText() != null && num2.getText() != null)

        {

            int num1Value = Integer.parseInt(num1.getText().toString());
            int num2Value = Integer.parseInt(num2.getText().toString());

            if (operatorSelection != null && num1Value != 0 && num2Value != 0)

            { // if loop
                switch (operatorSelection)

                {

                    case "+": String addResult = Integer.toString(num1Value + num2Value);
                        output.setText(addResult);

                        break;

                    case "-": String subResult = Integer.toString(num1Value - num2Value);
                        output.setText(subResult);

                        break;

                    case "*": String multResult = Integer.toString(num1Value * num2Value);
                        output.setText(multResult);

                        break;

                    case "/": String divResult = Integer.toString(num1Value / num2Value);
                        output.setText(divResult);

                        break;

                    case "%": String modResult = Integer.toString(num1Value % num2Value);
                        output.setText(modResult);
                        break;
                }
            }
        }
    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        operatorSelection = parent.getItemAtPosition(position).toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {
        operatorSelection = null;
    }
}



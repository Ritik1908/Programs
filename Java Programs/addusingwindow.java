import java.io.*;
import java.awt.*;
import java.awt.event.*;

class addition extends Frame implements ActionListener
{
	TextField t1;
	TextField t2;
	Button b;
	Label l;
	addition()
	{
		setTitle("Addition");
		setSize(300,300);
		t1 = new TextField("Number 1");
		add(t1);
		t2 = new TextField("Number 2");
		add(t2);
		b = new Button("Add");
		add(b);
		b.addActionListener(this);
		l = new Label();
		add(l);
		setLayout(new FlowLayout());
		setVisible(true);
	}
	
	public void actionPerformed(ActionEvent ae)
	{
		if(ae.getSource() == b)
		{
			int n1 = Integer.parseInt(t1.getText());
			int n2 = Integer.parseInt(t2.getText());
			l.setText(Integer.toString(n1+n2));
			System.out.println(n1);
		}
	}
}

class addusingwindow
{
	public static void main(String args[])
	{
		new addition();
	}
}

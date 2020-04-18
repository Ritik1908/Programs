import java.awt.*;
import java.awt.event.*;

class bc extends Frame implements ActionListener
{
	Button b1, b2, b3;
	bc()
	{
		setTitle("Color App");
		setSize(400, 400);
		setBackground(Color.cyan);
		b1=new Button("Green");
		b2=new Button("Blue");
		b3=new Button("Reset");
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		add(b1);
		add(b2);
		add(b3);
		setLayout(new FlowLayout());
		setVisible(true);
		addWindowListener(new window2());
	}
	public void actionPerformed(ActionEvent ae)
	{
		if(ae.getSource() == b1)
		{
			setBackground(Color.green);
		}
		if(ae.getSource() == b2)
		{
			setBackground(Color.blue);
		}
		if(ae.getSource() == b3)
		{
			setBackground(Color.cyan);
		}
	}
}

class windowprog
{
	public static void main(String args[])
	{
		new bc();
	}
}

class window2 extends WindowAdapter
{
	public void windowClosing(WindowEvent we)
	{
		System.exit(0);
	}
}


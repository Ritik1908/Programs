import java.awt.*;

class MyFrame extends Frame
{
	MyFrame()
	{
		setTitle("New Frame");
		setSize(200,300);
		setBackground(Color.red);
		setVisible(true);
	}
}

class frame
{
	public static void main(String args[])
	{
		new MyFrame();
	}
}

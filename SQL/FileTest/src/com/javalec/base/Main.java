package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Main {

	private JFrame frame;
	private JLabel lblResult;
	private JButton btnCat;
	private JButton btnDog;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main window = new Main();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Main() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.getContentPane().add(getLblResult());
		frame.getContentPane().add(getBtnCat());
		frame.getContentPane().add(getBtnDog());
	}
	private JLabel getLblResult() {
		if (lblResult == null) {
			lblResult = new JLabel("");
			lblResult.setBounds(38, 50, 169, 141);
		}
		return lblResult;
	}
	private JButton getBtnCat() {
		if (btnCat == null) {
			btnCat = new JButton("cat");
			btnCat.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					lblResult.setIcon(new ImageIcon(Main.class.getResource("/com/javalec/image/cat.png")));
				}
			});
			btnCat.setBounds(242, 59, 117, 29);
		}
		return btnCat;
	}
	private JButton getBtnDog() {
		if (btnDog == null) {
			btnDog = new JButton("dog");
			btnDog.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					lblResult.setIcon(new ImageIcon(Main.class.getResource("/com/javalec/image/dog.png")));
				}
			});
			btnDog.setBounds(242, 113, 117, 29);
		}
		return btnDog;
	}
}

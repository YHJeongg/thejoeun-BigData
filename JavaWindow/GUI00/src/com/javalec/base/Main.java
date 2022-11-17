package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Main {

	private JFrame frmButtonTest;
	private JLabel lblNewLabel;
	private JLabel lblNation;
	private JButton btnOK;
	private JButton btnDialog;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main window = new Main();
					window.frmButtonTest.setVisible(true);
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
		frmButtonTest = new JFrame();
		frmButtonTest.getContentPane().setBackground(new Color(255, 248, 221));
		frmButtonTest.getContentPane().setLayout(null);
		frmButtonTest.getContentPane().add(getLblNewLabel());
		frmButtonTest.getContentPane().add(getLblNation());
		frmButtonTest.getContentPane().add(getBtnOK());
		frmButtonTest.getContentPane().add(getBtnDialog());
		frmButtonTest.setBackground(new Color(255, 248, 221));
		frmButtonTest.setTitle("Button Test");
		frmButtonTest.setBounds(100, 100, 450, 300);
		frmButtonTest.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("Java Swing Button Test");
			lblNewLabel.setBounds(48, 34, 150, 16);
		}
		return lblNewLabel;
	}
	private JLabel getLblNation() {
		if (lblNation == null) {
			lblNation = new JLabel("대한민국");
			lblNation.setBounds(48, 58, 61, 16);
		}
		return lblNation;
	}
	private JButton getBtnOK() {
		if (btnOK == null) {
			btnOK = new JButton("OK");
			btnOK.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					changeText();
				}	
			});
			btnOK.setBounds(168, 121, 117, 29);
		}
		return btnOK;
	}
	
	private void changeText() {
		if(lblNation.getText().equals("대한민국")) {
			lblNation.setText("Korea");
		} else {
			lblNation.setText("대한민국");
		}
	}
	private JButton getBtnDialog() {
		if (btnDialog == null) {
			btnDialog = new JButton("Dialogue");
			btnDialog.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					displayDialog();
				}
			});
			btnDialog.setBounds(168, 162, 117, 29);
		}
		return btnDialog;
	}
	
	private void displayDialog() {
		if(lblNation.getText().equals("대한민국")) {
			JOptionPane.showMessageDialog(null, "대한민국");
		} else {
			JOptionPane.showMessageDialog(null, "Korea");
		}
	}
}

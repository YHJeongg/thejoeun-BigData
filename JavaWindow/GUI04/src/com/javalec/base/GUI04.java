package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GUI04 {

	private JFrame frmPassword;
	private JLabel lblNewLabel;
	private JPasswordField pfInput;
	private JButton btnOK;
	private JTextField tfMessage;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI04 window = new GUI04();
					window.frmPassword.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GUI04() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmPassword = new JFrame();
		frmPassword.setTitle("Password");
		frmPassword.setBounds(100, 100, 450, 300);
		frmPassword.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmPassword.getContentPane().setLayout(null);
		frmPassword.getContentPane().add(getLblNewLabel());
		frmPassword.getContentPane().add(getPfInput());
		frmPassword.getContentPane().add(getBtnOK());
		frmPassword.getContentPane().add(getTfMessage());
	}

	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("Password:");
			lblNewLabel.setBounds(66, 78, 72, 16);
		}
		return lblNewLabel;
	}
	private JPasswordField getPfInput() {
		if (pfInput == null) {
			pfInput = new JPasswordField();
			pfInput.setBounds(134, 73, 104, 26);
		}
		return pfInput;
	}
	private JButton getBtnOK() {
		if (btnOK == null) {
			btnOK = new JButton("OK");
			btnOK.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					checkPassword();
				}
			});
			btnOK.setBounds(257, 73, 117, 29);
		}
		return btnOK;
	}
	private JTextField getTfMessage() {
		if (tfMessage == null) {
			tfMessage = new JTextField();
			tfMessage.setBounds(66, 123, 308, 26);
			tfMessage.setColumns(10);
		}
		return tfMessage;
	}

	private void checkPassword() {
		String passString = new String(pfInput.getPassword());
		tfMessage.setText("당신의 패스워드는 " + passString + " 입니다.");
	}
}
 
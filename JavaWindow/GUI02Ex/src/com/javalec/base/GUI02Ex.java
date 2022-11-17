package com.javalec.base;

import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import javax.swing.DefaultComboBoxModel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GUI02Ex {

	private JFrame frame;
	private JComboBox cbNum1;
	private JComboBox cbCalc;
	private JComboBox cbNum2;
	private JLabel lblResult;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI02Ex window = new GUI02Ex();
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
	public GUI02Ex() {
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
		frame.getContentPane().add(getCbNum1());
		frame.getContentPane().add(getCbCalc());
		frame.getContentPane().add(getCbNum2());
		frame.getContentPane().add(getLblResult());
	}

	private JComboBox getCbNum1() {
		if (cbNum1 == null) {
			cbNum1 = new JComboBox();
			cbNum1.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Calc();
				}
			});
			cbNum1.setModel(new DefaultComboBoxModel(new String[] {"1", "2", "3", "4", "5", "6", "7", "8", "9"}));
			cbNum1.setBounds(40, 54, 107, 27);
		}
		return cbNum1;
	}
	private JComboBox getCbCalc() {
		if (cbCalc == null) {
			cbCalc = new JComboBox();
			cbCalc.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Calc();
				}
			});
			cbCalc.setModel(new DefaultComboBoxModel(new String[] {"+", "-", "X", "/"}));
			cbCalc.setBounds(165, 54, 107, 27);
		}
		return cbCalc;
	}
	private JComboBox getCbNum2() {
		if (cbNum2 == null) {
			cbNum2 = new JComboBox();
			cbNum2.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Calc();
				}
			});
			cbNum2.setModel(new DefaultComboBoxModel(new String[] {"1", "2", "3", "4", "5", "6", "7", "8", "9"}));
			cbNum2.setBounds(284, 54, 107, 27);
		}
		return cbNum2;
	}
	private JLabel getLblResult() {
		if (lblResult == null) {
			lblResult = new JLabel("");
			lblResult.setHorizontalAlignment(SwingConstants.CENTER);
			lblResult.setBounds(52, 126, 339, 32);
			Font myFont1 = new Font("Serif", Font.BOLD, 20);
			lblResult.setFont(myFont1);
		}
		return lblResult;
	}

	private void Calc() {
		if (cbCalc.getSelectedItem().equals("+")) {
			String result = Integer.toString(Integer.parseInt(cbNum1.getSelectedItem().toString()) + Integer.parseInt(cbNum2.getSelectedItem().toString()));
			lblResult.setText(result);
		} else if (cbCalc.getSelectedItem().equals("-")) {
			String result = Integer.toString(Integer.parseInt(cbNum1.getSelectedItem().toString()) - Integer.parseInt(cbNum2.getSelectedItem().toString()));
			lblResult.setText(result);
		} else if (cbCalc.getSelectedItem().equals("X")) {
			String result = Integer.toString(Integer.parseInt(cbNum1.getSelectedItem().toString()) * Integer.parseInt(cbNum2.getSelectedItem().toString()));
			lblResult.setText(result);
		} else {
			String result = String.format("%.3f", (double) Integer.parseInt(cbNum1.getSelectedItem().toString()) / Integer.parseInt(cbNum2.getSelectedItem().toString()));
			lblResult.setText(result);
		}
	}
}

package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.ContainerAdapter;
import java.awt.event.ContainerEvent;

public class GUI01 {

	private JFrame frame;
	private JLabel lblNewLabel;
	private JTextField tfNum1;
	private JLabel lblCalc;
	private JTextField tfNum2;
	private JLabel lblNewLabel_1_1;
	private JTextField tfResult;
	private JButton btnAdd;
	private JTextField tfGetNum1;
	private JTextField tfGetNum2;
	private JLabel lblNewLabel_2;
	private JButton btnSub;
	private JButton btnMultiply;
	private JButton btnDivision;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI01 window = new GUI01();
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
	public GUI01() {
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
		frame.getContentPane().add(getLblNewLabel());
		frame.getContentPane().add(getTfNum1());
		frame.getContentPane().add(getLblCalc());
		frame.getContentPane().add(getTfNum2());
		frame.getContentPane().add(getLblNewLabel_1_1());
		frame.getContentPane().add(getTfResult());
		frame.getContentPane().add(getBtnAdd());
		frame.getContentPane().add(getTfGetNum1());
		frame.getContentPane().add(getTfGetNum2());
		frame.getContentPane().add(getLblNewLabel_2());
		frame.getContentPane().add(getBtnSub());
		frame.getContentPane().add(getBtnMultiply());
		frame.getContentPane().add(getBtnDivision());
	}

	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("숫자1:");
			lblNewLabel.setBounds(35, 57, 39, 16);
		}
		return lblNewLabel;
	}
	private JTextField getTfNum1() {
		if (tfNum1 == null) {
			tfNum1 = new JTextField();
			tfNum1.setHorizontalAlignment(SwingConstants.TRAILING);
			tfNum1.setBounds(86, 52, 71, 26);
			tfNum1.setColumns(10);
		}
		return tfNum1;
	}
	private JLabel getLblCalc() {
		if (lblCalc == null) {
			lblCalc = new JLabel("+");
			lblCalc.setBounds(138, 195, 10, 16);
		}
		return lblCalc;
	}
	private JTextField getTfNum2() {
		if (tfNum2 == null) {
			tfNum2 = new JTextField();
			tfNum2.setHorizontalAlignment(SwingConstants.TRAILING);
			tfNum2.setColumns(10);
			tfNum2.setBounds(86, 104, 71, 26);
		}
		return tfNum2;
	}
	private JLabel getLblNewLabel_1_1() {
		if (lblNewLabel_1_1 == null) {
			lblNewLabel_1_1 = new JLabel("=");
			lblNewLabel_1_1.setBounds(244, 195, 10, 16);
		}
		return lblNewLabel_1_1;
	}
	private JTextField getTfResult() {
		if (tfResult == null) {
			tfResult = new JTextField();
			tfResult.setEditable(false);
			tfResult.setHorizontalAlignment(SwingConstants.TRAILING);
			tfResult.setColumns(10);
			tfResult.setBounds(266, 190, 71, 26);
		}
		return tfResult;
	}
	private JButton getBtnAdd() {
		if (btnAdd == null) {
			btnAdd = new JButton("+");
			btnAdd.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					addSum();
					tfGetNum1();
					tfGetNum2();
				}
			});
			btnAdd.setBounds(254, 52, 39, 29);
		}
		return btnAdd;
	}
	
	private JTextField getTfGetNum1() {
		if (tfGetNum1 == null) {
			tfGetNum1 = new JTextField();
			tfGetNum1.setEditable(false);
			tfGetNum1.setHorizontalAlignment(SwingConstants.TRAILING);
			tfGetNum1.setColumns(10);
			tfGetNum1.setBounds(55, 190, 71, 26);
		}
		return tfGetNum1;
	}
	private JTextField getTfGetNum2() {
		if (tfGetNum2 == null) {
			tfGetNum2 = new JTextField();
			tfGetNum2.setEditable(false);
			tfGetNum2.setHorizontalAlignment(SwingConstants.TRAILING);
			tfGetNum2.setColumns(10);
			tfGetNum2.setBounds(160, 190, 71, 26);
		}
		return tfGetNum2;
	}
	private JLabel getLblNewLabel_2() {
		if (lblNewLabel_2 == null) {
			lblNewLabel_2 = new JLabel("숫자2:");
			lblNewLabel_2.setBounds(35, 109, 39, 16);
		}
		return lblNewLabel_2;
	}
	private JButton getBtnSub() {
		if (btnSub == null) {
			btnSub = new JButton("-");
			btnSub.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					subSum();
					tfGetNum1();
					tfGetNum2();
				}
			});
			btnSub.setBounds(310, 52, 39, 29);
		}
		return btnSub;
	}
	private JButton getBtnMultiply() {
		if (btnMultiply == null) {
			btnMultiply = new JButton("X");
			btnMultiply.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					multiSum();
					tfGetNum1();
					tfGetNum2();
				}
			});
			btnMultiply.setBounds(254, 93, 39, 29);
		}
		return btnMultiply;
	}
	private JButton getBtnDivision() {
		if (btnDivision == null) {
			btnDivision = new JButton("/");
			btnDivision.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					diviSum();
					tfGetNum1();
					tfGetNum2();
				}
			});
			btnDivision.setBounds(310, 93, 39, 29);
		}
		return btnDivision;
	}
	
	// --------------------------------------------------------
	
	private void tfGetNum1() {
		tfGetNum1.setText(tfNum1.getText());
	}
	
	private void tfGetNum2() {
		tfGetNum2.setText(tfNum2.getText());
	}
	
	private void addSum() {
		lblCalc.setText("+");
		try {
		int wkNum1 = Integer.parseInt(tfNum1.getText());
		int wkNum2 = Integer.parseInt(tfNum2.getText());
		
		String wkaddSum = Integer.toString(wkNum1 + wkNum2);
		tfResult.setText(wkaddSum);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "입력은 꼭 숫자로!");
		}
	}
	
	private void subSum() {
		lblCalc.setText("-");
		try {
		int wkNum1 = Integer.parseInt(tfNum1.getText());
		int wkNum2 = Integer.parseInt(tfNum2.getText());
		
		String wkaddSum = Integer.toString(wkNum1 - wkNum2);
		tfResult.setText(wkaddSum);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "입력은 꼭 숫자로!");
		}
	}
	
	private void multiSum() {
		lblCalc.setText("X");
		try {
		int wkNum1 = Integer.parseInt(tfNum1.getText());
		int wkNum2 = Integer.parseInt(tfNum2.getText());
		
		String wkaddSum = Integer.toString(wkNum1 * wkNum2);
		tfResult.setText(wkaddSum);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "입력은 꼭 숫자로!");
		}
	}

	private void diviSum() {
		lblCalc.setText("/");
		try {
		int wkNum1 = Integer.parseInt(tfNum1.getText());
		int wkNum2 = Integer.parseInt(tfNum2.getText());
		
		String wkaddSum = Integer.toString(wkNum1 / wkNum2);
		tfResult.setText(wkaddSum);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "입력은 꼭 숫자로!");
		}
	}
} // End Line

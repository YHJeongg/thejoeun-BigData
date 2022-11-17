package com.javalec.front;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import com.javalec.function.TwoNumberCalc;

import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class GUI01Ex {

	private JFrame frame;
	private JLabel lblNewLabel;
	private JTextField tfNum1;
	private JTextField tfNum2;
	private JLabel lblNewLabel_1;
	private JButton btnAdd;
	private JButton btnSub;
	private JButton btnMul;
	private JButton btnDiv;
	private JTextField tfResultNum1;
	private JTextField tfResultNum2;
	private JLabel lblSign;
	private JLabel lblNewLabel_2_1;
	private JTextField tfResult;
	/** 
	 * 2개의 숫자를 이용하여 가감승제 해보기 
	 * 
	 * - textfield 잠금 
	 * - 가감승제 계산
	 * - 기능 class로 분리 
	 * 
	 * 2022.09.22 : 시작
	 * */

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI01Ex window = new GUI01Ex();
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
	public GUI01Ex() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("두개의 숫자 가감승제");
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.getContentPane().add(getLblNewLabel());
		frame.getContentPane().add(getTfNum1());
		frame.getContentPane().add(getTfNum2());
		frame.getContentPane().add(getLblNewLabel_1());
		frame.getContentPane().add(getBtnAdd());
		frame.getContentPane().add(getBtnSub());
		frame.getContentPane().add(getBtnMul());
		frame.getContentPane().add(getBtnDiv());
		frame.getContentPane().add(getTfResultNum1());
		frame.getContentPane().add(getTfResultNum2());
		frame.getContentPane().add(getLblSign());
		frame.getContentPane().add(getLblNewLabel_2_1());
		frame.getContentPane().add(getTfResult());
		
		// 화면 중앙에 배치 
		
		// 메인 화면이 시작되기전 사용법 보여주기
		JOptionPane.showMessageDialog(null, "입력은 꼭 숫자로!", "사용법", JOptionPane.WARNING_MESSAGE);
		
	}

	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("숫자1 :");
			lblNewLabel.setBounds(53, 55, 61, 16);
		}
		return lblNewLabel;
	}
	private JTextField getTfNum1() {
		if (tfNum1 == null) {
			tfNum1 = new JTextField();
			tfNum1.addKeyListener(new KeyAdapter() {
				@Override
				public void keyPressed(KeyEvent e) {
					intStr();
				}
			});
			tfNum1.setHorizontalAlignment(SwingConstants.TRAILING);
			tfNum1.setBounds(97, 44, 97, 38);
			tfNum1.setColumns(10);
		}
		return tfNum1;
	}
	private JTextField getTfNum2() {
		if (tfNum2 == null) {
			tfNum2 = new JTextField();
			tfNum2.addKeyListener(new KeyAdapter() {
				@Override
				public void keyPressed(KeyEvent e) {
					intStr();
				}
			});
			tfNum2.setHorizontalAlignment(SwingConstants.TRAILING);
			tfNum2.setColumns(10);
			tfNum2.setBounds(97, 94, 97, 38);
		}
		return tfNum2;
	}
	private JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("숫자2 :");
			lblNewLabel_1.setBounds(53, 105, 61, 16);
		}
		return lblNewLabel_1;
	}
	private JButton getBtnAdd() {
		if (btnAdd == null) {
			btnAdd = new JButton("+");
			btnAdd.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					// 덧셈 기능
					// - 계산하기
					// - tfResult등에 입력값 넣어주기
					// - 계산 부호 변경하기
					addition();
				}
			});
			btnAdd.setBounds(272, 42, 48, 38);
		}
		return btnAdd;
	}
	private JButton getBtnSub() {
		if (btnSub == null) {
			btnSub = new JButton("-");
			btnSub.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					subtraction();
				}
			});
			btnSub.setBounds(336, 41, 48, 38);
		}
		return btnSub;
	}
	private JButton getBtnMul() {
		if (btnMul == null) {
			btnMul = new JButton("X");
			btnMul.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					multiplication();
				}
			});
			btnMul.setBounds(272, 94, 48, 38);
		}
		return btnMul;
	}
	private JButton getBtnDiv() {
		if (btnDiv == null) {
			btnDiv = new JButton("/");
			btnDiv.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					division();
				}
			});
			btnDiv.setBounds(336, 94, 48, 38);
		}
		return btnDiv;
	}
	private JTextField getTfResultNum1() {
		if (tfResultNum1 == null) {
			tfResultNum1 = new JTextField();
			tfResultNum1.setEditable(false);
			tfResultNum1.setHorizontalAlignment(SwingConstants.TRAILING);
			tfResultNum1.setColumns(10);
			tfResultNum1.setBounds(36, 177, 97, 38);
		}
		return tfResultNum1;
	}
	private JTextField getTfResultNum2() {
		if (tfResultNum2 == null) {
			tfResultNum2 = new JTextField();
			tfResultNum2.setEditable(false);
			tfResultNum2.setHorizontalAlignment(SwingConstants.TRAILING);
			tfResultNum2.setColumns(10);
			tfResultNum2.setBounds(162, 177, 97, 38);
		}
		return tfResultNum2;
	}
	private JLabel getLblSign() {
		if (lblSign == null) {
			lblSign = new JLabel("+");
			lblSign.setBounds(145, 188, 11, 16);
		}
		return lblSign;
	}
	private JLabel getLblNewLabel_2_1() {
		if (lblNewLabel_2_1 == null) {
			lblNewLabel_2_1 = new JLabel("=");
			lblNewLabel_2_1.setBounds(272, 188, 11, 16);
		}
		return lblNewLabel_2_1;
	}
	private JTextField getTfResult() {
		if (tfResult == null) {
			tfResult = new JTextField();
			tfResult.setEditable(false);
			tfResult.setHorizontalAlignment(SwingConstants.TRAILING);
			tfResult.setColumns(10);
			tfResult.setBounds(297, 177, 97, 38);
		}
		return tfResult;
	}
	
	
	// -------------------- Functions -----------------------
	
	private void addition() {
		lblSign.setText("+");
		
		tfResultNum1.setText(tfNum1.getText());
		tfResultNum2.setText(tfNum2.getText());

		TwoNumberCalc calc = new TwoNumberCalc();
		tfResult.setText(calc.addition(tfNum1.getText(), tfNum2.getText()));
	}

	private void subtraction() {
		lblSign.setText("-");
		tfResultNum1.setText(tfNum1.getText());
		tfResultNum2.setText(tfNum2.getText());

		TwoNumberCalc calc = new TwoNumberCalc();
		tfResult.setText(calc.subtraction(tfNum1.getText(), tfNum2.getText()));
	}

	private void multiplication() {
		lblSign.setText("X");
		tfResultNum1.setText(tfNum1.getText());
		tfResultNum2.setText(tfNum2.getText());

		TwoNumberCalc calc = new TwoNumberCalc();
		tfResult.setText(calc.multiplication(tfNum1.getText(), tfNum2.getText()));
	}

	private void division() {
		lblSign.setText("/");
		tfResultNum1.setText(tfNum1.getText());
		tfResultNum2.setText(tfNum2.getText());
		if(zeroCheck()) {
			TwoNumberCalc calc = new TwoNumberCalc();
			tfResult.setText(calc.division(tfNum1.getText(), tfNum2.getText()));
		} else {
			tfResult.setText("Error");
			JOptionPane.showMessageDialog(null, "0은 나눗셈으로 사용 불가합니다.", "경고", JOptionPane.WARNING_MESSAGE);
		}
	}

	// 나눗셈시 분모에 0이 들어 온것을 확인한다.
	private boolean zeroCheck() {
		if(tfResultNum2.getText().equals("0")) {
			return false;
		} else {
			return true;
		}
	}
	
	private void intStr() {
		String intStr1 = tfNum1.getText().replaceAll("[^0-9]", "");
		String intStr2 = tfNum2.getText().replaceAll("[^0-9]", "");
		tfNum1.setText(intStr1);
		tfNum2.setText(intStr2);
	}
}

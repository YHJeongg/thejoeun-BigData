package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JCheckBox;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GUI03 {

	private JFrame frmCheckBox;
	private JCheckBox cbApple;
	private JCheckBox cbBanana;
	private JButton btnFruits;
	private JTextField tfFruits;
	private JRadioButton rbKBS;
	private JRadioButton rbMBC;
	private JButton btnBroad;
	private JTextField tfBroad;
	private final ButtonGroup buttonGroup = new ButtonGroup();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI03 window = new GUI03();
					window.frmCheckBox.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GUI03() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmCheckBox = new JFrame();
		frmCheckBox.setTitle("Check Box / Radio Button");
		frmCheckBox.setBounds(100, 100, 450, 300);
		frmCheckBox.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmCheckBox.getContentPane().setLayout(null);
		frmCheckBox.getContentPane().add(getCbApple());
		frmCheckBox.getContentPane().add(getCbBanana());
		frmCheckBox.getContentPane().add(getBtnFruits());
		frmCheckBox.getContentPane().add(getTfFruits());
		frmCheckBox.getContentPane().add(getRbKBS());
		frmCheckBox.getContentPane().add(getRbMBC());
		frmCheckBox.getContentPane().add(getBtnBroad());
		frmCheckBox.getContentPane().add(getTfBroad());
	}
	private JCheckBox getCbApple() {
		if (cbApple == null) {
			cbApple = new JCheckBox("Apple");
			cbApple.setBounds(39, 48, 128, 23);
		}
		return cbApple;
	}
	private JCheckBox getCbBanana() {
		if (cbBanana == null) {
			cbBanana = new JCheckBox("Banana");
			cbBanana.setBounds(39, 83, 128, 23);
		}
		return cbBanana;
	}
	private JButton getBtnFruits() {
		if (btnFruits == null) {
			btnFruits = new JButton("OK");
			btnFruits.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					fruitsCheck();
				}
			});
			btnFruits.setBounds(39, 118, 128, 29);
		}
		return btnFruits;
	}
	private JTextField getTfFruits() {
		if (tfFruits == null) {
			tfFruits = new JTextField();
			tfFruits.setBounds(19, 162, 195, 26);
			tfFruits.setColumns(10);
		}
		return tfFruits;
	}
	private JRadioButton getRbKBS() {
		if (rbKBS == null) {
			rbKBS = new JRadioButton("KBS");
			rbKBS.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					broadCheck();
				}
			});
			rbKBS.setSelected(true);
			buttonGroup.add(rbKBS);
			rbKBS.setBounds(248, 48, 141, 23);
		}
		return rbKBS;
	}
	private JRadioButton getRbMBC() {
		if (rbMBC == null) {
			rbMBC = new JRadioButton("MBC");
			rbMBC.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					broadCheck();
				}
			});
			buttonGroup.add(rbMBC);
			rbMBC.setBounds(248, 83, 141, 23);
		}
		return rbMBC;
	}
	private JButton getBtnBroad() {
		if (btnBroad == null) {
			btnBroad = new JButton("OK");
			btnBroad.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					broadCheck();
				}
			});
			btnBroad.setBounds(258, 118, 128, 29);
		}
		return btnBroad;
	}
	private JTextField getTfBroad() {
		if (tfBroad == null) {
			tfBroad = new JTextField();
			tfBroad.setColumns(10);
			tfBroad.setBounds(232, 162, 181, 26);
		}
		return tfBroad;
	}
	
	// ----- Function -----
	
	private void broadCheck() {
		if(rbKBS.isSelected()) {
			tfBroad.setText("KBS가 선택 되었습니다.");
		}
		
		if(rbMBC.isSelected()) {
			tfBroad.setText("MBC가 선택 되었습니다.");
		}
	}
	
	private void fruitsCheck() {
		if(cbApple.isSelected() && cbBanana.isSelected()) {
			tfFruits.setText("Apple과 Banana가 선택 되었습니다.");
		} else if(cbApple.isSelected()) {
			tfFruits.setText("Apple이 선택 되었습니다.");
		} else if(cbBanana.isSelected()) {
			tfFruits.setText("Banana가 선택 되었습니다.");
		} else {
			tfFruits.setText("");
		}
		
	}
}

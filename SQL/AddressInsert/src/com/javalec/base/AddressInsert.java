package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.javalec.function.DBConnect;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.awt.event.ActionEvent;

public class AddressInsert {

	private JFrame frame;
	private JTextField tfName;
	private JTextField tfTelNo;
	private JTextField tfAddress;
	private JTextField tfEmail;
	private JTextField tfRelation;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					AddressInsert window = new AddressInsert();
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
	public AddressInsert() {
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
		
		tfName = new JTextField();
		tfName.setBounds(124, 6, 218, 26);
		frame.getContentPane().add(tfName);
		tfName.setColumns(10);
		
		JLabel lblNewLabel = new JLabel("성명 : ");
		lblNewLabel.setBounds(38, 6, 61, 16);
		frame.getContentPane().add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("전화번호 :");
		lblNewLabel_1.setBounds(38, 56, 61, 16);
		frame.getContentPane().add(lblNewLabel_1);
		
		tfTelNo = new JTextField();
		tfTelNo.setColumns(10);
		tfTelNo.setBounds(124, 56, 218, 26);
		frame.getContentPane().add(tfTelNo);
		
		JLabel lblNewLabel_2 = new JLabel("주소 :");
		lblNewLabel_2.setBounds(38, 108, 61, 16);
		frame.getContentPane().add(lblNewLabel_2);
		
		tfAddress = new JTextField();
		tfAddress.setColumns(10);
		tfAddress.setBounds(124, 108, 218, 26);
		frame.getContentPane().add(tfAddress);
		
		JLabel lblNewLabel_3 = new JLabel("전자우편 :");
		lblNewLabel_3.setBounds(38, 159, 61, 16);
		frame.getContentPane().add(lblNewLabel_3);
		
		tfEmail = new JTextField();
		tfEmail.setColumns(10);
		tfEmail.setBounds(124, 159, 218, 26);
		frame.getContentPane().add(tfEmail);
		
		JLabel lblNewLabel_4 = new JLabel("관계 :");
		lblNewLabel_4.setBounds(38, 213, 61, 16);
		frame.getContentPane().add(lblNewLabel_4);
		
		tfRelation = new JTextField();
		tfRelation.setColumns(10);
		tfRelation.setBounds(124, 213, 218, 26);
		frame.getContentPane().add(tfRelation);
		
		JButton btnNewButton = new JButton("입력");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// 입력항목 Check
				int i_chk = insertFieldCheck();
				if(i_chk == 0) {
					insertAction();
				}
				// 입력항목에 이상이 없을 경우에만 DB에 입력한다.
			}
		});
		btnNewButton.setBounds(327, 237, 117, 29);
		frame.getContentPane().add(btnNewButton);
	}
	
	// Functions
	
	// 입력항목 Check
	private int insertFieldCheck() {
		int i = 0;
		String message = "";
		
		if(tfName.getText().trim().length() == 0) {
			i++;
			message = "이름을 ";
		}
		
		if(tfTelNo.getText().trim().length() == 0) {
			i++;
			message = "전화번호를 ";
		}
		
		if(tfAddress.getText().trim().length() == 0) {
			i++;
			message = "주소를 ";
		}
		
		if(tfEmail.getText().trim().length() == 0) {
			i++;
			message = "전자우편을 ";
		}
		if(tfRelation.getText().trim().length() == 0) {
			i++;
			message = "관계를 ";
		}
		
		if(i > 0) {
			JOptionPane.showMessageDialog(null, message + "확인하세요!");
		}
		
		return i;
	}
	
	private void insertAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "insert into userinfo (name, telno, address, email, relation) ";
			String query1 = "values (?, ?, ?, ?, ?)";
			
			ps = conn_mysql.prepareStatement(query + query1);
			ps.setString(1, tfName.getText().trim());
			ps.setString(2, tfTelNo.getText().trim());
			ps.setString(3, tfAddress.getText().trim());
			ps.setString(4, tfEmail.getText().trim());
			ps.setString(5, tfRelation.getText().trim());
			
			ps.executeUpdate();
			
			conn_mysql.close();
			
//			JOptionPane.showMessageDialog(null, tfName.getText() + "님의 정보가 입력 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
//	return check;
	}
	
	
}

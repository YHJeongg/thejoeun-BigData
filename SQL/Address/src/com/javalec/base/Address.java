package com.javalec.base;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

import com.javalec.function.DBConnect;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;

public class Address {

   private JFrame frame;
   private JComboBox cbSelection;
   private JTextField tfSelection;
   private JButton btnQuery;
   private JScrollPane scrollPane;
   private JTable Inner_Table;
   private JLabel lblSeqno;
   private JTextField tfSeqno;
   private JLabel lblName;
   private JTextField tfName;
   private JLabel lblTelno;
   private JTextField tfTelno;
   private JLabel lblAddress;
   private JTextField tfAddress;
   private JLabel lblEmail;
   private JTextField tfEmail;
   private JLabel lblRelation;
   private JTextField tfRelation;

   // --Table Definition
   private final DefaultTableModel Outer_Table = new DefaultTableModel();
   private JButton btnOk;
   private JRadioButton rbtnInsert;
   private JRadioButton rbtnUpdate;
   private JRadioButton rbtnDelete;
   private JRadioButton rbtnSearch;
   private final ButtonGroup buttonGroup = new ButtonGroup();

   /**
    * Launch the application.
    */
   public static void main(String[] args) {
      EventQueue.invokeLater(new Runnable() {
         public void run() {
            try {
               Address window = new Address();
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
   public Address() {
      initialize();
   }

   /**
    * Initialize the contents of the frame.
    */
   private void initialize() {
      frame = new JFrame();
      frame.getContentPane().setBackground(new Color(255, 215, 255));
      frame.addWindowListener(new WindowAdapter() {
         @Override
         public void windowActivated(WindowEvent e) {
            tableInit();
            searchAction();
         }
      });
      frame.setTitle("주소록");
      frame.setBounds(100, 100, 485, 480);
      frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      frame.getContentPane().setLayout(null);
      frame.getContentPane().add(getCbSelection());
      frame.getContentPane().add(getTfSelection());
      frame.getContentPane().add(getBtnQuery());
      frame.getContentPane().add(getScrollPane());
      frame.getContentPane().add(getLblSeqno());
      frame.getContentPane().add(getTfSeqno());
      frame.getContentPane().add(getLblName());
      frame.getContentPane().add(getTfName());
      frame.getContentPane().add(getLblTelno());
      frame.getContentPane().add(getTfTelno());
      frame.getContentPane().add(getLblAddress());
      frame.getContentPane().add(getTfAddress());
      frame.getContentPane().add(getLblEmail());
      frame.getContentPane().add(getTfEmail());
      frame.getContentPane().add(getLblRelation());
      frame.getContentPane().add(getTfRelation());
      frame.getContentPane().add(getBtnOk());
      frame.getContentPane().add(getRbtnInsert());
      frame.getContentPane().add(getRbtnUpdate());
      frame.getContentPane().add(getRbtnDelete());
      frame.getContentPane().add(getRbtnSearch());
   }

   private JComboBox getCbSelection() {
      if (cbSelection == null) {
         cbSelection = new JComboBox();
         cbSelection.setModel(new DefaultComboBoxModel(new String[] {"이름", "주소", "관계"}));
         cbSelection.setBounds(36, 46, 81, 29);
      }
      return cbSelection;
   }

   private JTextField getTfSelection() {
      if (tfSelection == null) {
         tfSelection = new JTextField();
         tfSelection.setBounds(129, 48, 208, 21);
         tfSelection.setColumns(10);
      }
      return tfSelection;
   }

   private JButton getBtnQuery() {
      if (btnQuery == null) {
         btnQuery = new JButton("검색");
         btnQuery.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               conditionQuery();
            }
         });
         btnQuery.setBounds(339, 47, 97, 23);
      }
      return btnQuery;
   }

   private JScrollPane getScrollPane() {
      if (scrollPane == null) {
         scrollPane = new JScrollPane();
         scrollPane.setBounds(36, 87, 400, 124);
         scrollPane.setViewportView(getInner_Table());
      }
      return scrollPane;
   }

   private JTable getInner_Table() {
      if (Inner_Table == null) {
         Inner_Table = new JTable();
         Inner_Table.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
               if (e.getButton() == 1) {
                  tableClick();
               }
            }
         });
         Inner_Table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
         Inner_Table.setModel(Outer_Table);
      }
      return Inner_Table;
   }

   private JLabel getLblSeqno() {
      if (lblSeqno == null) {
         lblSeqno = new JLabel("Sequence No");
         lblSeqno.setBounds(57, 223, 105, 15);
      }
      return lblSeqno;
   }

   private JTextField getTfSeqno() {
      if (tfSeqno == null) {
         tfSeqno = new JTextField();
         tfSeqno.setEditable(false);
         tfSeqno.setBounds(184, 220, 191, 21);
         tfSeqno.setColumns(10);
      }
      return tfSeqno;
   }

   private JLabel getLblName() {
      if (lblName == null) {
         lblName = new JLabel("이름");
         lblName.setBounds(57, 253, 105, 15);
      }
      return lblName;
   }

   private JTextField getTfName() {
      if (tfName == null) {
         tfName = new JTextField();
         tfName.setColumns(10);
         tfName.setBounds(184, 250, 191, 21);
      }
      return tfName;
   }

   private JLabel getLblTelno() {
      if (lblTelno == null) {
         lblTelno = new JLabel("전화번호");
         lblTelno.setBounds(57, 283, 105, 15);
      }
      return lblTelno;
   }

   private JTextField getTfTelno() {
      if (tfTelno == null) {
         tfTelno = new JTextField();
         tfTelno.setColumns(10);
         tfTelno.setBounds(184, 280, 191, 21);
      }
      return tfTelno;
   }

   private JLabel getLblAddress() {
      if (lblAddress == null) {
         lblAddress = new JLabel("주소");
         lblAddress.setBounds(57, 313, 105, 15);
      }
      return lblAddress;
   }

   private JTextField getTfAddress() {
      if (tfAddress == null) {
         tfAddress = new JTextField();
         tfAddress.setColumns(10);
         tfAddress.setBounds(184, 310, 191, 21);
      }
      return tfAddress;
   }

   private JLabel getLblEmail() {
      if (lblEmail == null) {
         lblEmail = new JLabel("전자우편");
         lblEmail.setBounds(57, 343, 105, 15);
      }
      return lblEmail;
   }

   private JTextField getTfEmail() {
      if (tfEmail == null) {
         tfEmail = new JTextField();
         tfEmail.setColumns(10);
         tfEmail.setBounds(184, 339, 191, 21);
      }
      return tfEmail;
   }

   private JLabel getLblRelation() {
      if (lblRelation == null) {
         lblRelation = new JLabel("관계");
         lblRelation.setBounds(57, 372, 105, 15);
      }
      return lblRelation;
   }

   private JTextField getTfRelation() {
      if (tfRelation == null) {
         tfRelation = new JTextField();
         tfRelation.setColumns(10);
         tfRelation.setBounds(184, 369, 191, 21);
      }
      return tfRelation;
   }
   
	private JButton getBtnOk() {
		if (btnOk == null) {
			btnOk = new JButton("OK");
			btnOk.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					if (rbtnInsert.isSelected() == true) {
						insertAction();
					} else if (rbtnUpdate.isSelected() == true) {
						updateAction();
					} else if (rbtnDelete.isSelected() == true) {
						deleteAction();
					} else {
						searchAction();
					}
					tableInit();
					searchAction();
					clearColumn();
				}
			});
			btnOk.setBounds(258, 402, 117, 29);
		}
		return btnOk;
	}

// DB to Table
	private void searchAction() {
		String whereStatement = "select seqno, name, telno, relation from userinfo";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement);
			
			while(rs.next()) {
				String[] qTxt = {rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)};
				Outer_Table.addRow(qTxt);
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void tableClick() {
		int i = Inner_Table.getSelectedRow();
		String wkSequence = (String) Inner_Table.getValueAt(i, 0);
		
		String whereStatement = "select seqno, name, telno, address, email, relation from userinfo ";
		String whereStatement2 = "where seqno = ";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement + whereStatement2 + wkSequence);
			
			if(rs.next()) {
				tfSeqno.setText(rs.getString(1));
				tfName.setText(rs.getString(2));
				tfTelno.setText(rs.getString(3));
				tfAddress.setText(rs.getString(4));
				tfEmail.setText(rs.getString(5));
				tfRelation.setText(rs.getString(6));
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void tableInit() {
		
		Outer_Table.addColumn("순서");
		Outer_Table.addColumn("이름");
		Outer_Table.addColumn("전화번호");
		Outer_Table.addColumn("관계");
		
		Outer_Table.setColumnCount(4);
		
		int i = Outer_Table.getRowCount();		
		for (int j = 0; j < i; j++) {
			Outer_Table.removeRow(0);
		}
		
		Inner_Table.setAutoResizeMode(Inner_Table.AUTO_RESIZE_OFF);
		
		int vColIndex = 0;
		TableColumn col = Inner_Table.getColumnModel().getColumn(vColIndex);
		int width = 40;
		col.setPreferredWidth(width);

		vColIndex = 1;
		col = Inner_Table.getColumnModel().getColumn(vColIndex);
		width = 80;
		col.setPreferredWidth(width);
		
		vColIndex = 2;
		col = Inner_Table.getColumnModel().getColumn(vColIndex);
		width = 120;
		col.setPreferredWidth(width);
		
		vColIndex = 3;
		col = Inner_Table.getColumnModel().getColumn(vColIndex);
		width = 50;
		col.setPreferredWidth(width);
	}
	
	private void conditionQuery() {
		int i = cbSelection.getSelectedIndex();
		String conditionQueryColumn = "";
		switch(i) {
			case 0:
				conditionQueryColumn = "name";
				break;
			case 1:
				conditionQueryColumn = "address";
				break;
			case 2:
				conditionQueryColumn = "relation";
				break;
			default:
				break;
		}
		
		tableInit();
		clearColumn();
		conditionQueryAction(conditionQueryColumn);
	}
	
	private void clearColumn() {
		tfSeqno.setText("");
		tfName.setText("");
		tfTelno.setText("");
		tfAddress.setText("");
		tfEmail.setText("");
		tfRelation.setText("");
	}
	
	private void conditionQueryAction(String conditionQueryColumn) {
		String whereStatement = "select seqno, name, telno, relation from userinfo where " + conditionQueryColumn;
		String whereStatement2 = " like '%'" + tfSelection.getText() + "'%'";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			ResultSet rs = stmt_mysql.executeQuery(whereStatement + whereStatement2);
			
			while(rs.next()) {
				String[] qTxt = {rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)};
				Outer_Table.addRow(qTxt);
			}
			
			conn_mysql.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deleteAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "delete from userinfo where seqno = ? ";
			
			ps = conn_mysql.prepareStatement(query);
			ps.setInt(1, Integer.parseInt(tfSeqno.getText()));
			ps.executeUpdate();
			
			conn_mysql.close();
			
			JOptionPane.showMessageDialog(null, tfName.getText() + "님의 정보가 삭제 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void updateAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "update userinfo set name = ?, telno = ?, address = ?, email = ?, relation = ? ";
			String query2 = "where seqno = ?";
			
			ps = conn_mysql.prepareStatement(query + query2);
			ps.setString(1, tfName.getText().trim());
			ps.setString(2, tfTelno.getText().trim());
			ps.setString(3, tfAddress.getText().trim());
			ps.setString(4, tfEmail.getText().trim());
			ps.setString(5, tfRelation.getText().trim());
			ps.setInt(6, Integer.parseInt(tfSeqno.getText()));
			ps.executeUpdate();
			
			conn_mysql.close();
			
			JOptionPane.showMessageDialog(null, tfName.getText() + "님의 정보가 수정 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void insertAction() {
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn_mysql = DriverManager.getConnection(DBConnect.url_mysql, DBConnect.id_mysql, DBConnect.pw_mysql);
			Statement stmt_mysql = conn_mysql.createStatement();
			
			String query = "insert into userinfo (name, telno, address, email, relation) ";
			String query2 = "values (?, ?, ?, ?, ?)";
			
			ps = conn_mysql.prepareStatement(query + query2);
			ps.setString(1, tfName.getText().trim());
			ps.setString(2, tfTelno.getText().trim());
			ps.setString(3, tfAddress.getText().trim());
			ps.setString(4, tfEmail.getText().trim());
			ps.setString(5, tfRelation.getText().trim());
			ps.executeUpdate();
			
			conn_mysql.close();
			
			JOptionPane.showMessageDialog(null, tfName.getText() + "님의 정보가 입력 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private JRadioButton getRbtnInsert() {
		if (rbtnInsert == null) {
			rbtnInsert = new JRadioButton("입력");
			buttonGroup.add(rbtnInsert);
			rbtnInsert.setBounds(36, 11, 59, 23);
		}
		return rbtnInsert;
	}
	private JRadioButton getRbtnUpdate() {
		if (rbtnUpdate == null) {
			rbtnUpdate = new JRadioButton("수정");
			buttonGroup.add(rbtnUpdate);
			rbtnUpdate.setBounds(103, 11, 59, 23);
		}
		return rbtnUpdate;
	}
	private JRadioButton getRbtnDelete() {
		if (rbtnDelete == null) {
			rbtnDelete = new JRadioButton("삭제");
			buttonGroup.add(rbtnDelete);
			rbtnDelete.setBounds(174, 11, 59, 23);
		}
		return rbtnDelete;
	}
	private JRadioButton getRbtnSearch() {
		if (rbtnSearch == null) {
			rbtnSearch = new JRadioButton("검색");
			buttonGroup.add(rbtnSearch);
			rbtnSearch.setBounds(245, 11, 59, 23);
		}
		return rbtnSearch;
	}
}
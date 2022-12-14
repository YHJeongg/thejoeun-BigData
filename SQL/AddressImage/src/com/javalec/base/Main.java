package com.javalec.base;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;

import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.border.EmptyBorder;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

import com.javalec.dto.Dto;
import com.javalec.dao.Dao;
import com.javalec.util.ShareVar;

import javax.swing.ImageIcon;
import javax.swing.SwingConstants;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class Main extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	@SuppressWarnings("rawtypes")
	private JComboBox cbSelection;
	private JTextField tfSelection;
	private JButton btnQuery;
	private JScrollPane scrollPane;
	private JTable Inner_Table;
	// --- Table
	private final DefaultTableModel Outer_Table = new DefaultTableModel();
    // -----
    private JLabel lblSequenceNo;
    private JLabel label;
    private JLabel label_1;
    private JLabel label_2;
    private JLabel label_3;
    private JLabel label_4;
    private JTextField tfSeqno;
    private JTextField tfName;
    private JTextField tfTelno;
    private JTextField tfAddress;
    private JTextField tfEmail;
    private JTextField tfRelation;
    private JButton btnOK;
    private JRadioButton rbInsert;
    private JRadioButton rbUpdate;
    private JRadioButton rbDelete;
    private JRadioButton rbQuery;
    private final ButtonGroup buttonGroup = new ButtonGroup();
    private JLabel label_5;
    private JTextField tfFilePath;
    private JButton btnFilePath;
    private JLabel lblImage;


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main frame = new Main();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Main() {
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowOpened(WindowEvent e) {
				TableInit();
				SearchAction();
				ScreenPartition();
				
			}
		});
		setTitle(">>>> ????????? <<<<");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 472, 693);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		contentPane.add(getCbSelection());
		contentPane.add(getTfSelection());
		contentPane.add(getBtnQuery());
		contentPane.add(getScrollPane());
		
		lblSequenceNo = new JLabel("Sequence No :");
		lblSequenceNo.setBounds(29, 229, 101, 16);
		contentPane.add(lblSequenceNo);
		
		label = new JLabel("?????? :");
		label.setBounds(29, 267, 61, 16);
		contentPane.add(label);
		
		label_1 = new JLabel("???????????? :");
		label_1.setBounds(29, 306, 61, 16);
		contentPane.add(label_1);
		
		label_2 = new JLabel("?????? :");
		label_2.setBounds(29, 343, 61, 16);
		contentPane.add(label_2);
		
		label_3 = new JLabel("????????????");
		label_3.setBounds(29, 381, 61, 16);
		contentPane.add(label_3);
		
		label_4 = new JLabel("?????? :");
		label_4.setBounds(29, 418, 61, 16);
		contentPane.add(label_4);
		
		tfSeqno = new JTextField();
		tfSeqno.setEditable(false);
		tfSeqno.setBounds(129, 224, 67, 26);
		contentPane.add(tfSeqno);
		tfSeqno.setColumns(10);
		
		tfName = new JTextField();
		tfName.setBounds(129, 262, 95, 26);
		contentPane.add(tfName);
		tfName.setColumns(10);
		
		tfTelno = new JTextField();
		tfTelno.setBounds(129, 301, 130, 26);
		contentPane.add(tfTelno);
		tfTelno.setColumns(10);
		
		tfAddress = new JTextField();
		tfAddress.setBounds(129, 338, 301, 26);
		contentPane.add(tfAddress);
		tfAddress.setColumns(10);
		
		tfEmail = new JTextField();
		tfEmail.setBounds(129, 376, 207, 26);
		contentPane.add(tfEmail);
		tfEmail.setColumns(10);
		
		tfRelation = new JTextField();
		tfRelation.setBounds(129, 413, 301, 26);
		contentPane.add(tfRelation);
		tfRelation.setColumns(10);
		
		btnOK = new JButton("OK");
		btnOK.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ActionPartition();
			}
		});
		btnOK.setBounds(315, 549, 117, 29);
		contentPane.add(btnOK);
		
		rbInsert = new JRadioButton("??????");
		rbInsert.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ScreenPartition();
			}
		});
		buttonGroup.add(rbInsert);
		rbInsert.setBounds(22, 19, 61, 23);
		contentPane.add(rbInsert);
		
		rbUpdate = new JRadioButton("??????");
		rbUpdate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ScreenPartition();
			}
		});
		buttonGroup.add(rbUpdate);
		rbUpdate.setBounds(83, 19, 61, 23);
		contentPane.add(rbUpdate);
		
		rbDelete = new JRadioButton("??????");
		rbDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ScreenPartition();
			}
		});
		buttonGroup.add(rbDelete);
		rbDelete.setBounds(147, 19, 61, 23);
		contentPane.add(rbDelete);
		
		rbQuery = new JRadioButton("??????");
		rbQuery.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ScreenPartition();
			}
		});
		buttonGroup.add(rbQuery);
		rbQuery.setSelected(true);
		rbQuery.setBounds(206, 18, 67, 23);
		contentPane.add(rbQuery);
		contentPane.add(getLabel_5());
		contentPane.add(getTfFilePath());
		contentPane.add(getBtnFilePath());
		contentPane.add(getLblImage());
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private JComboBox getCbSelection() {
		if (cbSelection == null) {
			cbSelection = new JComboBox();
			cbSelection.setModel(new DefaultComboBoxModel(new String[] {"??????", "??????", "??????"}));
			cbSelection.setBounds(29, 54, 88, 27);
		}
		return cbSelection;
	}
	private JTextField getTfSelection() {
		if (tfSelection == null) {
			tfSelection = new JTextField();
			tfSelection.setBounds(129, 53, 188, 26);
			tfSelection.setColumns(10);
		}
		return tfSelection;
	}
	private JButton getBtnQuery() {
		if (btnQuery == null) {
			btnQuery = new JButton("??????");
			btnQuery.setToolTipText("?????? ?????? ?????????");
			btnQuery.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					ConditionQuery();
				}
			});
			btnQuery.setBounds(329, 53, 101, 29);
		}
		return btnQuery;
	}
	private JScrollPane getScrollPane() {
		if (scrollPane == null) {
			scrollPane = new JScrollPane();
			scrollPane.setBounds(29, 93, 401, 124);
			scrollPane.setViewportView(getInner_Table());
		}
		return scrollPane;
	}
	private JTable getInner_Table() {
		if (Inner_Table == null) {
			Inner_Table = new JTable();
			Inner_Table.addKeyListener(new KeyAdapter() {
				@Override
				public void keyReleased(KeyEvent e) {
					TableClick();
				}
			});
			Inner_Table.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					if (e.getButton() == 1){
						TableClick();
					}
				}
			});
			Inner_Table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			Inner_Table.setModel(Outer_Table); // <--***************************************************
		}
		return Inner_Table;
	}
	
// -------------------
	// Table ?????????
	@SuppressWarnings("static-access")
	private void TableInit(){
        int i = Outer_Table.getRowCount();
        
        Outer_Table.addColumn("Seq.");
        Outer_Table.addColumn("??????");
        Outer_Table.addColumn("????????????");
        Outer_Table.addColumn("??????");
        Outer_Table.setColumnCount(4);

        for(int j = 0 ; j < i ; j++){
            Outer_Table.removeRow(0);
        }

        Inner_Table.setAutoResizeMode(Inner_Table.AUTO_RESIZE_OFF);
        

        int vColIndex = 0;
        TableColumn col = Inner_Table.getColumnModel().getColumn(vColIndex);
        int width = 40;
        col.setPreferredWidth(width);

        vColIndex = 1;
        col = Inner_Table.getColumnModel().getColumn(vColIndex);
        width = 100;
        col.setPreferredWidth(width);

        vColIndex = 2;
        col = Inner_Table.getColumnModel().getColumn(vColIndex);
        width = 100;
        col.setPreferredWidth(width);

        vColIndex = 3;
        col = Inner_Table.getColumnModel().getColumn(vColIndex);
        width = 200;
        col.setPreferredWidth(width);

	}
	
	//?????? ??????????????? Table??? 
	private void SearchAction(){
		Dao dbAction = new Dao();
		ArrayList<Dto> beanList = dbAction.SelectList();
		
		int listCount = beanList.size();
		
		for (int index = 0; index < listCount; index++) {
			String temp = Integer.toString(beanList.get(index).getSeqno());
			String[] qTxt = {temp, beanList.get(index).getName(), beanList.get(index).getTelno(), beanList.get(index).getRelation()};
			Outer_Table.addRow(qTxt);
		}

	}
	
	// Table?????? Row??? Click??? ?????? 
	private void TableClick() {
        int i = Inner_Table.getSelectedRow();
        String tkSequence = (String)Inner_Table.getValueAt(i, 0);
        int wkSequence = Integer.parseInt(tkSequence);
        
        Dao dbAction = new Dao(wkSequence);
        Dto dto = dbAction.TableClick();
        
        tfSeqno.setText(Integer.toString(dto.getSeqno()));
        tfName.setText(dto.getName());
        tfTelno.setText(dto.getTelno());
        tfAddress.setText(dto.getAddress());
        tfEmail.setText(dto.getEmail());
        tfRelation.setText(dto.getRelation());
        
        // Image??????
        // File name??? ????????? ?????? ??????????????? ????????????   
        // ShareVar?????? int????????? ???????????? ?????? ???????????? ?????? file name?????? ????????? ??????
        
		String filePath = Integer.toString(ShareVar.filename);
		tfFilePath.setText(filePath);
		
		lblImage.setIcon(new ImageIcon(filePath));
		lblImage.setHorizontalAlignment(SwingConstants.CENTER);
		
		File file = new File(filePath);
		file.delete();
		
		tfFilePath.setText("");

        
	}
	
	// ?????? ?????? ?????? ?????? 
	private void ConditionQuery() {
		int i = cbSelection.getSelectedIndex();
		String ConditionQueryColumn = "";
		switch (i) {
		case 0:
			ConditionQueryColumn = "name";
			break;
		case 1:
			ConditionQueryColumn = "address";
			break;
		case 2:
			ConditionQueryColumn = "relation";
			break;
		default:
			break;
		}
		
		TableInit();
		ClearColumn();
		ConditionQueryAction(ConditionQueryColumn);

	}
	
	// DataField ??????
	private void ClearColumn() {
		tfSeqno.setText("");
		tfName.setText("");
		tfTelno.setText("");
		tfAddress.setText("");
		tfEmail.setText("");
		tfRelation.setText("");
		tfFilePath.setText("");
		
	}
	
	// ???????????? ?????? 
	private void ConditionQueryAction(String ConditionQueryColumn) {
		Dao dbAction = new Dao(ConditionQueryColumn, tfSelection.getText());
		ArrayList<Dto> beanList = dbAction.ConditionList();
		
		int listCount = beanList.size();
		
		for (int index = 0; index < listCount; index++) {
			String temp = Integer.toString(beanList.get(index).getSeqno());
			String[] qTxt = {temp, beanList.get(index).getName(), beanList.get(index).getTelno(), beanList.get(index).getRelation()};
			Outer_Table.addRow(qTxt);
		}
	}
	
	// Data ??????
	private void UpdateAction() {
		int seqno = Integer.parseInt(tfSeqno.getText());
		String name = tfName.getText();
		String telno = tfTelno.getText();
		String address = tfAddress.getText();
		String email = tfEmail.getText();
		String relation = tfRelation.getText();
		
		// Image File
		FileInputStream input = null;
		File file = new File(tfFilePath.getText());
		try {
			input = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao dbaction = new Dao(seqno, name, telno, address, email, relation, input);
		boolean aaa = dbaction.UpdateAction();
		if(aaa == true){
	          JOptionPane.showMessageDialog(null, tfName.getText()+" ?????? ????????? ?????? ???????????????.!");                    
		}else{
	          JOptionPane.showMessageDialog(null, "DB??? ?????? ????????? ????????? ??????????????????! \n ????????????????????? ???????????????!");                    
		}

	}
	
	// Data ??????
	private void DeleteAction() {
		int seqno = Integer.parseInt(tfSeqno.getText());
		
		Dao dbaction = new Dao(seqno);
		boolean aaa = dbaction.DeleteAction();
		if(aaa == true){
	          JOptionPane.showMessageDialog(null, tfName.getText()+" ?????? ????????? ?????? ???????????????.!");                    
		}else{
	          JOptionPane.showMessageDialog(null, "DB??? ?????? ????????? ????????? ??????????????????! \n ????????????????????? ???????????????!");                    
		}
	
	}
	
	// ?????? ?????? 
	private void ScreenPartition() {
		// ????????? ?????? 
		if(rbQuery.isSelected() == true) {
			btnOK.setVisible(false);
			btnFilePath.setVisible(false);
			tfName.setEditable(false);
			tfTelno.setEditable(false);
			tfAddress.setEditable(false);
			tfEmail.setEditable(false);
			tfRelation.setEditable(false);
		}
		
		// ????????? ??????
		if(rbInsert.isSelected() == true) {
			btnOK.setVisible(true);
			btnFilePath.setVisible(true);
			tfName.setEditable(true);
			tfTelno.setEditable(true);
			tfAddress.setEditable(true);
			tfEmail.setEditable(true);
			tfRelation.setEditable(true);			
		}
		
		// ????????? ??????
		if(rbUpdate.isSelected() == true) {
			btnOK.setVisible(true);
			btnFilePath.setVisible(true);
			tfName.setEditable(true);
			tfTelno.setEditable(true);
			tfAddress.setEditable(true);
			tfEmail.setEditable(true);
			tfRelation.setEditable(true);						
		}
		
		// ????????? ?????? 
		if(rbDelete.isSelected() == true) {
			btnOK.setVisible(true);
			btnFilePath.setVisible(true);
			tfName.setEditable(false);
			tfTelno.setEditable(false);
			tfAddress.setEditable(false);
			tfEmail.setEditable(false);
			tfRelation.setEditable(false);
		}
		ClearColumn();
	}
	
	// Action ?????? 
	private void ActionPartition() {
		// ????????? ??????
		if(rbQuery.isSelected() == true) {
			ScreenPartition();			
		}
		
		// ????????? ?????? 
		if(rbInsert.isSelected() == true) {
			int i_chk = insertFieldCheck();
			if(i_chk == 0){
				insertAction();
				TableInit();
				SearchAction();
				ClearColumn();
			}else {
				JOptionPane.showMessageDialog(null, "????????? ?????? ??????! ");        			
				
			}			
			ScreenPartition();
		}
		
		// ????????? ??????
		if(rbUpdate.isSelected() == true) {
			int i_chk = insertFieldCheck();
			if(i_chk == 0){
				UpdateAction();
				TableInit();
				SearchAction();
				ClearColumn();
			}else {
				JOptionPane.showMessageDialog(null, "????????? ?????? ?????? ! ");        			
				
			}			
			ScreenPartition();
		}
		
		// ????????? ??????
		if(rbDelete.isSelected() == true) {
			DeleteAction();
			TableInit();
			SearchAction();
			ClearColumn();			
			ScreenPartition();
		}
	}
	
	
	private int insertFieldCheck(){
		int i = 0;
		if(tfName.getText().length() == 0){
			i++;
			tfName.requestFocus();
		}
		if(tfTelno.getText().length() == 0){
			i++;
			tfTelno.requestFocus();
		}
		if(tfAddress.getText().length() == 0){
			i++;
			tfAddress.requestFocus();
		}
		if(tfEmail.getText().length() == 0){
			i++;
			tfEmail.requestFocus();
		}
		if(tfRelation.getText().length() == 0){
			i++;
			tfRelation.requestFocus();
		}
				
		return i;
	}
	
	private void insertAction(){
		String name = tfName.getText();
		String telno = tfTelno.getText();
		String address = tfAddress.getText();
		String email = tfEmail.getText();
		String relation = tfRelation.getText();
		
		// Image File
		FileInputStream input = null;
		File file = new File(tfFilePath.getText());
		try {
			input = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dao dbaction = new Dao(name, telno, address, email, relation, input);
		boolean aaa = dbaction.InsertAction();
		if(aaa == true){
	          JOptionPane.showMessageDialog(null, tfName.getText()+" ?????? ????????? ?????? ???????????????.!");                    
		}else{
	          JOptionPane.showMessageDialog(null, "DB??? ?????? ????????? ????????? ??????????????????! \n ????????????????????? ???????????????!");                    
		}
	}
	
	private JLabel getLabel_5() {
		if (label_5 == null) {
			label_5 = new JLabel("????????? ???????????? :");
			label_5.setBounds(29, 456, 101, 16);
		}
		return label_5;
	}
	
	private JTextField getTfFilePath() {
		if (tfFilePath == null) {
			tfFilePath = new JTextField();
			tfFilePath.setEditable(false);
			tfFilePath.setColumns(10);
			tfFilePath.setBounds(129, 451, 301, 26);
		}
		return tfFilePath;
	}
	
	private JButton getBtnFilePath() {
		if (btnFilePath == null) {
			btnFilePath = new JButton("?????? ??????");
			btnFilePath.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					FilePath();
				}
			});
			btnFilePath.setBounds(315, 478, 117, 29);
		}
		return btnFilePath;
	}
	
	private JLabel getLblImage() {
		if (lblImage == null) {
			lblImage = new JLabel("");
			lblImage.setHorizontalAlignment(SwingConstants.CENTER);
			lblImage.setBounds(22, 484, 215, 161);
		}
		return lblImage;
	}
	
	private void FilePath() {
		JFileChooser chooser = new JFileChooser();
		FileNameExtensionFilter filter = new FileNameExtensionFilter("JPG, PNG, BMP", "jpg","png","bmp");
		chooser.setFileFilter(filter);
		
		int ret = chooser.showOpenDialog(null);
		if(ret != JFileChooser.APPROVE_OPTION) {
			JOptionPane.showMessageDialog(null, "????????? ???????????? ???????????????!", "??????", JOptionPane.WARNING_MESSAGE);
			return;
		}
		String filePath = chooser.getSelectedFile().getPath();
		tfFilePath.setText(filePath);
		lblImage.setIcon(new ImageIcon(filePath));
		lblImage.setHorizontalAlignment(SwingConstants.CENTER);
	}
	
	
	
} // -------------------

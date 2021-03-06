package superclasses;

import java.awt.Color;
import java.awt.BorderLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import javax.swing.border.EtchedBorder;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JMenu;

import entities.RefUser;
import main.Common;
import main.LoginDialog;

public abstract class RoleFrame extends JFrame implements ActionListener {
	private static final long serialVersionUID = 1L;
	
	protected JMenuBar menuBar;
	protected JPanel contentPane, dataPanel;
	
	public RoleFrame() {
		setResizable(true);
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent arg0) {
				closeFrame(arg0);
			}
		});
		
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setBounds(0, 0, 1024, 768);
		
		menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmLogout = new JMenuItem("Logout");
		mntmLogout.setActionCommand("LOGOUT");
		mntmLogout.addActionListener(this);
		mnFile.add(mntmLogout);
		
		JMenuItem mntmExit = new JMenuItem("Exit");
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				closeFrame(e);
			}
		});
		mnFile.add(mntmExit);
		
		contentPane = new JPanel();
		contentPane.setAutoscrolls(true);
		contentPane.setBackground(Color.LIGHT_GRAY);
		contentPane.setBorder(new EtchedBorder());
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		dataPanel = new JPanel();
		contentPane.add(dataPanel, BorderLayout.CENTER);
		dataPanel.setLayout(new BorderLayout(0, 0));
		
	}
	
	private void closeFrame(java.awt.AWTEvent evt) {
		//if (Common.showConfirmDialog(this, "You really want to exit?", "Exit") == JOptionPane.YES_OPTION) 
			System.exit(0);
    }
	
	protected void showTitle(String title) {
		RefUser user = Common.getRegisteredUser();
		String userPart = user == null ? " " : " " + user.toString() + " / ";
		setTitle(title + userPart + Common.getRegisteredKonto());
	}
	
	protected void showListPanel(ListPanel listPanel) {
		dataPanel.removeAll();
		dataPanel.add(listPanel, BorderLayout.CENTER);
		SwingUtilities.updateComponentTreeUI(dataPanel);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		switch (e.getActionCommand()) {
		case "LOGOUT":
			dispose();
			Common.showFrame(new LoginDialog());
			break;
		default:
			break;
		}
	}
}

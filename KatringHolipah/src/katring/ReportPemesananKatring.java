/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package katring;

/**
 *
 * @author achma
 */
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.awt.BorderLayout;
import java.awt.Container;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class ReportPemesananKatring extends javax.swing.JFrame {

    /**
     * Creates new form ReportPemesananKatring
     */
    Connection connection;
    java.sql.Statement stat,stat1,stat2;
    ResultSet rs;
    String total, sql, sql1, sql2, roleDB, id, nowMonth;
    
    public ReportPemesananKatring(String month) {
        try {
            initComponents();
            this.setLocationRelativeTo(null);
            ConnectionDB condb = new ConnectionDB();
            condb.Config();
            connection = (Connection) condb.connect;
            stat = (Statement) condb.stmt;
            nowMonth = month;
            Process();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ReportPemesananKatring.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private ReportPemesananKatring() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void Process() throws FileNotFoundException
    {
        try{
            ConnectionDB condb = new ConnectionDB();
            condb.Config();
            connection = (Connection) condb.connect;
            stat = (Statement) condb.stmt;
            
            Map prs = new HashMap();
        
            //String reportPath = System.getProperty("user.dir") + "/src/Report/ApprovementReport.jrxml";
            
            InputStream filePath = getClass().getResourceAsStream("/Report/TotalPemesananKatring.jrxml");
            JasperDesign jd1 = JRXmlLoader.load (filePath);
            
            
            sql = "select catering.idPesan, catering.tanggal,catering.nama, catering.detail, catering.status\n" +
                "from catering, bayarcatering where catering.idPesan = bayarcatering.idPesan and catering.tanggal like '% "+nowMonth+"%'";
            JRDesignQuery newQuery = new JRDesignQuery();
            newQuery.setText(sql);
            jd1.setQuery(newQuery);
            JasperReport Jrpt1 = JasperCompileManager.compileReport(jd1);
            JasperPrint jp1 = JasperFillManager.fillReport(Jrpt1, prs,condb.connect);
            net.sf.jasperreports.view.JRViewer viewer1 = new net.sf.jasperreports.view.JRViewer(jp1);
            Container c1 = getContentPane();
            c1.setLayout(new BorderLayout());
            c1.add(viewer1);
        
        }catch(JRException e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ReportPemesananKatring.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ReportPemesananKatring.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ReportPemesananKatring.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ReportPemesananKatring.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ReportPemesananKatring().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}

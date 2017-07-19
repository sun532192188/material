package com.material.website.util;

import java.awt.BasicStroke;  
import java.awt.BorderLayout;  
import java.awt.Color;  
import java.awt.Component;  
import java.awt.Dimension;  
import java.awt.Font;  
import java.awt.FontMetrics;  
import java.awt.Graphics;  
import java.awt.Graphics2D;  
import java.awt.GridLayout;  
import java.awt.event.ActionEvent;  
import java.awt.event.ActionListener;  
import java.awt.event.MouseAdapter;  
import java.awt.event.MouseEvent;  
import java.awt.print.PageFormat;  
import java.awt.print.Printable;  
import java.awt.print.PrinterException;  
import java.awt.print.PrinterJob;  
  
import javax.swing.JButton;  
import javax.swing.JDialog;  
import javax.swing.JFrame;  
import javax.swing.JPanel;  
import javax.swing.JScrollPane;  
import javax.swing.JTextArea;  
import javax.swing.SwingUtilities;  
import javax.swing.WindowConstants;  
import javax.swing.text.BadLocationException;  
import javax.swing.text.Document;  
  
/** 
 * 使用了原始的分页方式去渲染JTextArea，提供了打印预览机制。 
 * <p> 
 * 事实上，我们还可以通过其他方式打印JTextArea： 
 * <ol> 
 * <li>{@code Component.print(Graphics g);} or 
 * {@code Component.printAll(Graphics g);}</li> 
 * <li>{@code Component.paint(Graphics g);} or 
 * {@code Component.paintAll(Graphics g);} whose rending may be slightly 
 * different to the previous method (for example, <code>JFrame</code>)</li> 
 * <li>{@code JTable.print();} or {@code JTextComponent.print();} provide 
 * especially powerful and convenient printing mechanism</li> 
 * </ol> 
 *  
 * @author Gaowen 
 */  
public class PrintUIComponent extends JPanel implements ActionListener,  
        Printable {  
    private static final long serialVersionUID = 4797002827940419724L;  
    private static JFrame frame;  
    private JTextArea textAreaToPrint;  
    private PrinterJob job;  
    private int[] pageBreaks;// array of page break line positions  
    private String[] textLines;  
    private Header header;  
  
    public PrintUIComponent() {  
        super(new BorderLayout());  
        textAreaToPrint = new JTextArea(50, 20);  
        for (int i = 1; i <= 50; i++) {  
            textAreaToPrint.append("Line " + i + "\n");  
        }  
        JScrollPane scrollPane = new JScrollPane(textAreaToPrint);  
        scrollPane.setPreferredSize(new Dimension(250, 200));  
        add(scrollPane, BorderLayout.CENTER);  
        JButton printButton = new JButton("Print This TextArea");  
        printButton.setName("printButton");  
        printButton.addActionListener(this);  
        JButton printPreviewButton = new JButton("Print Preview");  
        printPreviewButton.setName("printPreviewButton");  
        printPreviewButton.addActionListener(this);  
        JPanel buttonGroup = new JPanel(new GridLayout(2, 1));  
        buttonGroup.add(printButton);  
        buttonGroup.add(printPreviewButton);  
        add(buttonGroup, BorderLayout.SOUTH);  
  
        /* Initialize PrinterJob */  
        initPrinterJob();  
    }  
  
    public static void main(String[] args) {  
        SwingUtilities.invokeLater(new Runnable() {  
            @Override  
            public void run() {  
                createAndShowGUI();  
            }  
        });  
    }  
  
    private static void createAndShowGUI() {  
        frame = new JFrame("Print UI Example");  
        frame.setContentPane(new PrintUIComponent());  
        frame.pack();  
        frame.setLocationRelativeTo(null);  
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
        frame.setVisible(true);  
    }  
  
    private void initTextLines() {  
        Document doc = textAreaToPrint.getDocument();  
        try {  
            String text = doc.getText(0, doc.getLength());  
            textLines = text.split("\n");  
        } catch (BadLocationException e) {  
            e.printStackTrace();  
        }  
    }  
  
    private void initPrinterJob() {  
        job = PrinterJob.getPrinterJob();  
        job.setJobName("Print TextArea");// 出现在系统打印任务列表  
        job.setPrintable(this);  
    }  
  
    @Override  
    public int print(Graphics graphics, PageFormat pageFormat, int pageIndex)  
            throws PrinterException {  
        /* 
         * It is safe to use a copy of this graphics as this will not involve 
         * changes to it. 
         */  
        Graphics2D g2 = (Graphics2D) graphics.create();  
  
        /* Calculate "pageBreaks" */  
        Font font = new Font("Serif", Font.PLAIN, 12);  
        FontMetrics metrics = g2.getFontMetrics(font);  
        int lineHeight = metrics.getHeight();  
        if (pageBreaks == null) {  
            initTextLines();  
            int linesPerPage = (int) (pageFormat.getImageableHeight() / lineHeight);  
            int numBreaks = (textLines.length - 1) / linesPerPage;  
            pageBreaks = new int[numBreaks];  
            for (int b = 0; b < numBreaks; b++) {  
                pageBreaks[b] = (b + 1) * linesPerPage;  
            }  
        }  
  
        /* Condition to exit printing */  
        if (pageIndex > pageBreaks.length) {  
            return NO_SUCH_PAGE;  
        }  
  
        /* (0,0) is outside the imageable area, translate to avoid clipping */  
        g2.translate(pageFormat.getImageableX(), pageFormat.getImageableY());  
  
        /* Draw each line that is on this page */  
        int y = 0;  
        int start = (pageIndex == 0) ? 0 : pageBreaks[pageIndex - 1];  
        int end = (pageIndex == pageBreaks.length) ? textLines.length  
                : pageBreaks[pageIndex];  
        for (int line = start; line < end; line++) {  
            y += lineHeight;  
            g2.drawString(textLines[line], 0, y);  
        }  
  
        /* dispose of the graphics copy */  
        g2.dispose();  
  
        /* Tell the caller that this page is part of the printed document */  
        return PAGE_EXISTS;  
    }  
  
    @Override  
    public void actionPerformed(ActionEvent e) {  
        Object actionEventSource = e.getSource();  
        if (actionEventSource instanceof JButton) {  
            JButton button = (JButton) actionEventSource;  
            if (button.getName().equals("printButton")) {  
                pageBreaks = null;// reset pagination  
                boolean ok = job.printDialog();  
                if (ok) {  
                    try {  
                        job.print();  
                    } catch (PrinterException ex) {  
                        /* The job did not successfully complete */  
                        ex.printStackTrace();  
                    }  
                }  
            } else if (button.getName().equals("printPreviewButton")) {  
                pageBreaks = null;// reset pagination  
                createAndShowPreviewDialog();  
            }  
        }  
    }  
  
    private void createAndShowPreviewDialog() {  
        JDialog previewDialog = new JDialog(frame, "Print Preview Dialog", true);  
        JPanel contentPane = new JPanel(new BorderLayout());  
        PreviewArea previewArea = new PreviewArea();  
        previewArea.addMouseListener(new PreviewAreaMouseAdapter(previewArea));  
        JScrollPane scrollPane = new JScrollPane(previewArea);  
        contentPane.add(scrollPane, BorderLayout.CENTER);  
        header = new Header(previewArea);  
        contentPane.add(header, BorderLayout.NORTH);  
        previewDialog.setContentPane(contentPane);  
        previewDialog.setSize(600, 600);  
        previewDialog  
                .setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);  
        previewDialog.setVisible(true);  
    }  
  
    private class Header extends Component {  
        private static final long serialVersionUID = -1741188309769027249L;  
        private PreviewArea previewArea;  
        private boolean paintable;  
  
        private Header(PreviewArea previewArea) {  
            this.previewArea = previewArea;  
        }  
  
        private void setPaintable(boolean paintable) {  
            this.paintable = paintable;  
        }  
  
        @Override  
        public void paint(Graphics g) {  
            if (paintable) {  
                g.setColor(Color.GRAY);  
                g.drawString(  
                        String.valueOf(previewArea.getPageIndex() + 1)  
                                + "/"  
                                + String.valueOf(pageBreaks.length + 1)  
                                + " pages (Click left mouse button to preview next page; right to previous)",  
                        10, 15);  
            }  
        }  
  
        @Override  
        public Dimension getPreferredSize() {  
            return new Dimension(super.getPreferredSize().width, 20);  
        }  
    }  
  
    private class PreviewArea extends Component {  
        private static final long serialVersionUID = -6384174997251439843L;  
        private PageFormat pageFormat;  
        private int pageIndex;  
        private int w;  
        private int h;  
        private final int marginX = 10;  
        private final int marginY = 20;  
  
        private PreviewArea() {  
            pageFormat = job.pageDialog(job.defaultPage());  
            pageIndex = 0;  
            w = (int) pageFormat.getWidth();  
            h = (int) pageFormat.getHeight();  
        }  
  
        private int getPageIndex() {  
            return pageIndex;  
        }  
  
        private void setPageIndex(int pageIndex) {  
            this.pageIndex = pageIndex;  
        }  
  
        @Override  
        public Dimension getPreferredSize() {  
            return new Dimension(w + 2 * marginX, h + 2 * marginY);  
        }  
  
        @Override  
        public void paint(Graphics g) {  
            Graphics2D g2 = (Graphics2D) g.create();  
            g2.translate(marginX, marginY);  
            g2.drawRect(0, 0, w, h);  
            int ix = (int) (pageFormat.getImageableX() - 1);  
            int iy = (int) (pageFormat.getImageableY() - 1);  
            int iw = (int) (pageFormat.getImageableWidth() + 1);  
            int ih = (int) (pageFormat.getImageableHeight() + 1);  
            g2.setStroke(new BasicStroke(1f, BasicStroke.CAP_ROUND,  
                    BasicStroke.JOIN_ROUND, 10f, new float[] { 5, 5 }, 0f));  
            g2.drawRect(ix, iy, iw, ih);  
            try {  
                PrintUIComponent.this.print(g2, pageFormat, pageIndex);  
            } catch (PrinterException e) {  
                e.printStackTrace();  
            }  
            g2.dispose();  
            header.setPaintable(true);  
            header.repaint();  
        }  
    }  
  
    private class PreviewAreaMouseAdapter extends MouseAdapter {  
        private PreviewArea previewArea;  
  
        private PreviewAreaMouseAdapter(PreviewArea previewArea) {  
            this.previewArea = previewArea;  
        }  
  
        @Override  
        public void mouseClicked(MouseEvent e) {  
            int currentIndex = previewArea.getPageIndex();  
            if (e.getButton() == MouseEvent.BUTTON1) {  
                /* next page */  
                if (currentIndex < pageBreaks.length) {  
                    previewArea.setPageIndex(currentIndex + 1);  
                    previewArea.repaint();  
                }  
            } else if (e.getButton() == MouseEvent.BUTTON3) {  
                /* previous page */  
                if (currentIndex > 0) {  
                    previewArea.setPageIndex(currentIndex - 1);  
                    previewArea.repaint();  
                }  
            }  
        }  
    }  
}  
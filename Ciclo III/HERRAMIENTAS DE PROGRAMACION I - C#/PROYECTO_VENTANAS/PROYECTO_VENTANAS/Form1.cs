using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROYECTO_VENTANAS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void bt_dialogo_01_Click(object sender, EventArgs e)
        {
            String strTitulo = tb_titulo.Text;

            if (strTitulo.Equals("factura"))
            {
                int precio = Convert.ToInt32(tb_men_01.Text);
                int cantidad = Convert.ToInt32(tb_men_02.Text);

                int subtotal = precio * cantidad;

                String strMensaje = "precio = "+precio + "\n" + 
                                    "cantidad ="+cantidad + "\n"+
                                    "subtotal ="+ subtotal + "\n" +
                                    "igv =" +(subtotal*0.18)+ "\n"+
                                    "neto =" +(subtotal * 1.18) ;

                MessageBox.Show(strMensaje, strTitulo);
            }
            else
            {
                String strMensaje = "INGRESAR LA PALABRA FACTURA";

                MessageBox.Show(strMensaje, strTitulo);
            }

        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
                    }

        private void bt_dialogo_02_Click(object sender, EventArgs e)
        {
            String strTitulo = tb_titulo.Text;
            String strMensaje = tb_men_01.Text + "\n" + tb_men_02.Text;

            if (rb_ok.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.OK);
            }
            if (rb_ok_cancel.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.OKCancel);
            }
            if (rb_yes_no.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.YesNo);
            }
            if (rb_yes_no_cancel.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.YesNoCancel);
            }
            if (rb_retry_cancel.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.RetryCancel);
            }
            if (rb_abort_retry_ignore.Checked)
            {
                MessageBox.Show(strMensaje, strTitulo, MessageBoxButtons.AbortRetryIgnore);
            }

        }
    }
}

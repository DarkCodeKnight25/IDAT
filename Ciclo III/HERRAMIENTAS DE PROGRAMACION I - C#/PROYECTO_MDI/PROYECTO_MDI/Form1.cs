using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROYECTO_MDI
{
    public partial class Form1 : Form
    {
        private Form2 hijo_01;
        private Form3 hijo_02;

        public Form1()
        {
            InitializeComponent();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void productosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (hijo_01 == null)
            {
                hijo_01 = new Form2();
                hijo_01.MdiParent = this;
                hijo_01.FormClosed += new FormClosedEventHandler(CerrarProductos);
                hijo_01.Show();
            }
            else
            {
                hijo_01.Activate();
            }
        }

        void CerrarProductos(object sender, FormClosedEventArgs e)
        {
            hijo_01 = null;
            tsl_mensaje.Text = "Acaba de cerrar el formulario de Productos";
        }






        private void calcularToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (hijo_02 == null)
            {
                hijo_02 = new Form3();
                hijo_02.MdiParent = this;
                hijo_02.FormClosed += new FormClosedEventHandler(CerrarCalculo);
                hijo_02.Show();
            }
            else
            {
                hijo_02.Activate();
            }
        }
        
        void CerrarCalculo(object sender, FormClosedEventArgs e)
        {
            hijo_01 = null;
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (hijo_01 == null)
            {
                hijo_01 = new Form2();
                hijo_01.MdiParent = this;
                hijo_01.FormClosed += new FormClosedEventHandler(CerrarProductos);
                hijo_01.Show();
            }
            else
            {
                hijo_01.Activate();
            }
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if (hijo_02 == null)
            {
                hijo_02 = new Form3();
                hijo_02.MdiParent = this;
                hijo_02.FormClosed += new FormClosedEventHandler(CerrarCalculo);
                hijo_02.Show();
            }
            else
            {
                hijo_01.Activate();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            tsl_mensaje.Text = "Bienvenido";
        }
    }
}

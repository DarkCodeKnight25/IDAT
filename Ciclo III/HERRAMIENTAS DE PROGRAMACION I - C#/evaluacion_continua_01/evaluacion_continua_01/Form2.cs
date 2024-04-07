using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace evaluacion_continua_01
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void pREGUNTA01ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form3 vent3 = new Form3();
            this.Hide();
            vent3.Show();
        }
    }
}

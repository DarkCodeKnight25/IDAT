using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CLASE_03
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void cb_pintar_Click(object sender, EventArgs e)
        {
            if (chb_rojo.Checked == true)
                this.BackColor = Color.Red;

            if (chb_azul.Checked == true)
                this.BackColor = Color.Blue;

            if (chb_verde.Checked == true)
                this.BackColor = Color.Green;

            if (chb_rojo.Checked == true  && chb_azul.Checked == true)
                this.BackColor = Color.Purple;

            if (chb_rojo.Checked == true && chb_verde.Checked == true)
                this.BackColor = Color.Brown;
        }
    }
}

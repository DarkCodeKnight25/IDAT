using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BASICO_01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void bt_suma_Click(object sender, EventArgs e)
        {
            int n1=0;
            int n2=0;
            int total = 0;

            n1 = Convert.ToInt32(tb_n1.Text);
            n2 = Convert.ToInt32(tb_n2.Text);

            total = n1 + n2;

            tb_n3.Text = total.ToString();

        }

        private void bt_limpiar_Click(object sender, EventArgs e)
        {
            tb_n1.Text = "";
            tb_n2.Text = "";
            tb_n3.Text = "";
            tb_n1.Focus();
        }

        private void bt_siguiente_Click(object sender, EventArgs e)
        {
            Form2 vent2 = new Form2();
            this.Hide();
            vent2.Show();

        }
    }
}

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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void rb_n1_CheckedChanged(object sender, EventArgs e)
        {
            tb_sueldo.Text = "3000";
        }

        private void rb_n2_CheckedChanged(object sender, EventArgs e)
        {
            tb_sueldo.Text = "2000";
        }

        private void rb_n3_CheckedChanged(object sender, EventArgs e)
        {
            tb_sueldo.Text = "1200";
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void bt_boni_Click(object sender, EventArgs e)
        {
            if (tb_sueldo.Text.Equals(""))
                MessageBox.Show("SELECCIONAR UN CARGO", "ERROR EN EL CARGO");
            else
            {
                int sueldo = Convert.ToInt32(tb_sueldo.Text);
                if (cbx_estado.Text.Equals(""))
                    MessageBox.Show("SELECCIONAR UN ESTADO CIVIL", "ERROR EN EL ESTADO CIVIL");
                else
                {
                    double boni = 0;
                    if (cbx_estado.Text.Equals("SOLTERO"))
                        boni = sueldo * 0.02;

                    if (cbx_estado.Text.Equals("CASADO"))
                        boni = sueldo * 0.04;

                    if (cbx_estado.Text.Equals("DIVORSIADO"))
                        boni = sueldo * 0.06;

                    if (cbx_estado.Text.Equals("VIUDO"))
                        boni = sueldo * 0.08;

                    tb_boni.Text = boni.ToString();

                }

            }
                
        }

        private void bt_descuento_Click(object sender, EventArgs e)
        {

            if (tb_sueldo.Text.Equals(""))
                MessageBox.Show("SELECCIONAR UN CARGO", "ERROR EN EL CARGO");
            else
            {
                int sueldo = Convert.ToInt32(tb_sueldo.Text);
                if (cbx_pension.Text.Equals(""))
                    MessageBox.Show("SELECCIONAR UNA PENSION", "ERROR EN LA PENSION");
                else
                {
                    double pension = 0;
                    if (cbx_pension.Text.Equals("AFP"))
                        pension = sueldo * 0.12;

                    if (cbx_pension.Text.Equals("ONP"))
                        pension = sueldo * 0.13;


                    tb_descuento.Text = pension.ToString();

                }

            }
        }
    }
}

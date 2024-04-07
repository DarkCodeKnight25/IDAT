using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace trabajo1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
             MessageBox.Show("VENTANA DE INCIO DE SESION", "Evento load");
        }

        private void bt_aceptar_Click(object sender, EventArgs e)
        {

            int oportunidades = Convert.ToInt32(lb_opor.Text);

            string usu = "";
            string pass = "";

            if (!tb_usuario.Equals("") && !tb_password.Equals(""))
            {
                usu = tb_usuario.Text;
                pass = tb_password.Text;
            }
            if (usu.Equals("idat") && pass == "123")
            {
               Form2 venta2 = new Form2();
               this.Hide();
               venta2.Show();
            }
            else
            {
                MessageBox.Show("ERROR AL INGRESAR EL USUARIO  O PASSWORD", "VENTANA VALIDACION");
                tb_usuario.Text = "";
                tb_password.Text = "";
                --oportunidades;
            }

            lb_opor.Text = oportunidades.ToString();

            if (oportunidades == 0)
                this.Close();

        }




    }
}

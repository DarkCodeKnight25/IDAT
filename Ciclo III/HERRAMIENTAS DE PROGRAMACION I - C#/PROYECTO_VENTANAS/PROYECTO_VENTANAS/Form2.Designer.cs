namespace PROYECTO_VENTANAS
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.tb_tecla = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lb_tecla = new System.Windows.Forms.Label();
            this.chb_alt = new System.Windows.Forms.CheckBox();
            this.chb_shift = new System.Windows.Forms.CheckBox();
            this.chb_ctrl = new System.Windows.Forms.CheckBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.lb_codigo = new System.Windows.Forms.Label();
            this.lb_datos = new System.Windows.Forms.Label();
            this.lb_valor = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(54, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(164, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "INGRESE DESDE EL TECLADO";
            // 
            // tb_tecla
            // 
            this.tb_tecla.Location = new System.Drawing.Point(241, 45);
            this.tb_tecla.Name = "tb_tecla";
            this.tb_tecla.Size = new System.Drawing.Size(190, 20);
            this.tb_tecla.TabIndex = 1;
            this.tb_tecla.KeyDown += new System.Windows.Forms.KeyEventHandler(this.tb_tecla_KeyDown);
            this.tb_tecla.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tb_tecla_KeyPress);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(54, 108);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(114, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "TECLA PRESIONADA";
            // 
            // lb_tecla
            // 
            this.lb_tecla.AutoSize = true;
            this.lb_tecla.Location = new System.Drawing.Point(238, 108);
            this.lb_tecla.Name = "lb_tecla";
            this.lb_tecla.Size = new System.Drawing.Size(16, 13);
            this.lb_tecla.TabIndex = 3;
            this.lb_tecla.Text = "...";
            // 
            // chb_alt
            // 
            this.chb_alt.AutoSize = true;
            this.chb_alt.Location = new System.Drawing.Point(57, 173);
            this.chb_alt.Name = "chb_alt";
            this.chb_alt.Size = new System.Drawing.Size(46, 17);
            this.chb_alt.TabIndex = 4;
            this.chb_alt.Text = "ALT";
            this.chb_alt.UseVisualStyleBackColor = true;
            // 
            // chb_shift
            // 
            this.chb_shift.AutoSize = true;
            this.chb_shift.Location = new System.Drawing.Point(57, 207);
            this.chb_shift.Name = "chb_shift";
            this.chb_shift.Size = new System.Drawing.Size(57, 17);
            this.chb_shift.TabIndex = 5;
            this.chb_shift.Text = "SHIFT";
            this.chb_shift.UseVisualStyleBackColor = true;
            // 
            // chb_ctrl
            // 
            this.chb_ctrl.AutoSize = true;
            this.chb_ctrl.Location = new System.Drawing.Point(57, 240);
            this.chb_ctrl.Name = "chb_ctrl";
            this.chb_ctrl.Size = new System.Drawing.Size(54, 17);
            this.chb_ctrl.TabIndex = 6;
            this.chb_ctrl.Text = "CTRL";
            this.chb_ctrl.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(238, 177);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(104, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "CODIGO DE TECLA";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(238, 211);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(99, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "DATOS DE TECLA";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(238, 244);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(98, 13);
            this.label6.TabIndex = 9;
            this.label6.Text = "VALOR DE TECLA";
            // 
            // lb_codigo
            // 
            this.lb_codigo.AutoSize = true;
            this.lb_codigo.Location = new System.Drawing.Point(396, 177);
            this.lb_codigo.Name = "lb_codigo";
            this.lb_codigo.Size = new System.Drawing.Size(16, 13);
            this.lb_codigo.TabIndex = 10;
            this.lb_codigo.Text = "...";
            // 
            // lb_datos
            // 
            this.lb_datos.AutoSize = true;
            this.lb_datos.Location = new System.Drawing.Point(396, 211);
            this.lb_datos.Name = "lb_datos";
            this.lb_datos.Size = new System.Drawing.Size(16, 13);
            this.lb_datos.TabIndex = 11;
            this.lb_datos.Text = "...";
            // 
            // lb_valor
            // 
            this.lb_valor.AutoSize = true;
            this.lb_valor.Location = new System.Drawing.Point(396, 244);
            this.lb_valor.Name = "lb_valor";
            this.lb_valor.Size = new System.Drawing.Size(16, 13);
            this.lb_valor.TabIndex = 12;
            this.lb_valor.Text = "...";
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(582, 302);
            this.Controls.Add(this.lb_valor);
            this.Controls.Add(this.lb_datos);
            this.Controls.Add(this.lb_codigo);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.chb_ctrl);
            this.Controls.Add(this.chb_shift);
            this.Controls.Add(this.chb_alt);
            this.Controls.Add(this.lb_tecla);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tb_tecla);
            this.Controls.Add(this.label1);
            this.Name = "Form2";
            this.Text = "EVENTOS DE TECLADO";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tb_tecla;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lb_tecla;
        private System.Windows.Forms.CheckBox chb_alt;
        private System.Windows.Forms.CheckBox chb_shift;
        private System.Windows.Forms.CheckBox chb_ctrl;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label lb_codigo;
        private System.Windows.Forms.Label lb_datos;
        private System.Windows.Forms.Label lb_valor;
    }
}
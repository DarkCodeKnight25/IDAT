namespace CLASE_03
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rb_n1 = new System.Windows.Forms.RadioButton();
            this.rb_n2 = new System.Windows.Forms.RadioButton();
            this.rb_n3 = new System.Windows.Forms.RadioButton();
            this.bt_tamaño = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bookman Old Style", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(37, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(397, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "TAMAÑO DE VENTANA";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rb_n3);
            this.groupBox1.Controls.Add(this.rb_n2);
            this.groupBox1.Controls.Add(this.rb_n1);
            this.groupBox1.Location = new System.Drawing.Point(44, 67);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(185, 195);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "TAMAÑO";
            // 
            // rb_n1
            // 
            this.rb_n1.AutoSize = true;
            this.rb_n1.Location = new System.Drawing.Point(23, 41);
            this.rb_n1.Name = "rb_n1";
            this.rb_n1.Size = new System.Drawing.Size(71, 17);
            this.rb_n1.TabIndex = 0;
            this.rb_n1.TabStop = true;
            this.rb_n1.Text = "640 * 480";
            this.rb_n1.UseVisualStyleBackColor = true;
            // 
            // rb_n2
            // 
            this.rb_n2.AutoSize = true;
            this.rb_n2.Location = new System.Drawing.Point(23, 78);
            this.rb_n2.Name = "rb_n2";
            this.rb_n2.Size = new System.Drawing.Size(71, 17);
            this.rb_n2.TabIndex = 1;
            this.rb_n2.TabStop = true;
            this.rb_n2.Text = "800 * 600";
            this.rb_n2.UseVisualStyleBackColor = true;
            // 
            // rb_n3
            // 
            this.rb_n3.AutoSize = true;
            this.rb_n3.Location = new System.Drawing.Point(23, 113);
            this.rb_n3.Name = "rb_n3";
            this.rb_n3.Size = new System.Drawing.Size(77, 17);
            this.rb_n3.TabIndex = 2;
            this.rb_n3.TabStop = true;
            this.rb_n3.Text = "1024 * 768";
            this.rb_n3.UseVisualStyleBackColor = true;
            // 
            // bt_tamaño
            // 
            this.bt_tamaño.Location = new System.Drawing.Point(278, 130);
            this.bt_tamaño.Name = "bt_tamaño";
            this.bt_tamaño.Size = new System.Drawing.Size(131, 42);
            this.bt_tamaño.TabIndex = 2;
            this.bt_tamaño.Text = "CAMBIAR TAMAÑO";
            this.bt_tamaño.UseVisualStyleBackColor = true;
            this.bt_tamaño.Click += new System.EventHandler(this.bt_tamaño_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(527, 274);
            this.Controls.Add(this.bt_tamaño);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Name = "Form2";
            this.Text = "TAMAÑO DE VENTANA";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rb_n3;
        private System.Windows.Forms.RadioButton rb_n2;
        private System.Windows.Forms.RadioButton rb_n1;
        private System.Windows.Forms.Button bt_tamaño;
    }
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Operations Guide | Ocean View Resort</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        :root { --gold: #D4AF37; --navy: #0a192f; --dark-bg: #060e1a; }
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7f9; margin: 0; color: #333; }
        .serif-font { font-family: 'Playfair Display', serif; }
        
        .top-nav { background: var(--dark-bg); padding: 12px 0; border-bottom: 2px solid var(--gold); position: sticky; top: 0; z-index: 1000; }
        
        .help-banner {
            background: linear-gradient(rgba(10, 25, 47, 0.85), rgba(10, 25, 47, 0.85)), 
                        url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1500&q=80');
            background-size: cover; background-position: center;
            color: white; padding: 60px 0; text-align: center;
        }

       
        .guide-container { padding-bottom: 50px; }

        .module-card {
            background: white; border-radius: 15px; border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05); margin-bottom: 40px;
            transition: transform 0.3s ease;
        }
        
        .module-card:hover { transform: translateY(-5px); }
        
        .step-indicator {
            background: var(--gold); color: var(--navy);
            padding: 5px 20px; border-radius: 50px;
            font-size: 0.8rem; font-weight: 800;
            display: inline-block; margin-bottom: 15px;
        }

        .img-frame {
            border: 1px solid #edf2f7; border-radius: 12px;
            overflow: hidden; background: #000;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            margin-top: 15px;
        }
        .img-frame img { width: 100%; height: auto; display: block; opacity: 0.9; }

        .sidebar-box { background: white; border-radius: 15px; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        
        .contact-btn {
            display: flex; align-items: center; gap: 12px;
            padding: 12px; border-radius: 10px; background: #f8fafc;
            margin-bottom: 10px; text-decoration: none; color: var(--navy);
            border-left: 4px solid var(--gold);
            transition: background 0.2s;
        }
        .contact-btn:hover { background: #f1f5f9; }

        footer { background: var(--dark-bg); color: white; padding: 40px 0; margin-top: 20px; }

        /* Ensure sticky sidebar doesn't overlap nav */
        .sticky-sidebar { position: sticky; top: 100px; }
    </style>
</head>
<body>

    <nav class="top-nav">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="text-white fw-bold"><i class="bi bi-gear-wide-connected text-warning me-2"></i>RESORT HELP CENTER</div>
            <a href="Dashboard.jsp" class="btn btn-sm btn-outline-warning px-4">Exit to Dashboard</a>
        </div>
    </nav>

    <header class="help-banner">
        <div class="container">
            <h1 class="serif-font display-4">System Operating Guide</h1>
            <p class="lead text-white-50">Visual guide for all 7 management modules</p>
        </div>
    </header>

    <div class="container py-5 guide-container">
        <div class="row g-5">
            
            <div class="col-lg-8">
                
                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 01</div>
                    <h3 class="serif-font text-navy">Staff Login</h3>
                    <p class="text-muted">Staff must log in using unique credentials. Check the 'Security standards met' indicator for password strength before clicking the Login button.</p>
                    <div class="img-frame">
                        <img src="images/9.png" alt="Login Screenshot">
                    </div>
                </section>

                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 02</div>
                    <h3 class="serif-font text-navy">New Guest Registration</h3>
                    <p class="text-muted">Fill out all guest fields including Reservation ID and contact details. Ensure room type is selected from the dropdown.</p>
                    <div class="img-frame">
                        <img src="images/10.png" alt="Registration Screenshot">
                    </div>
                </section>

                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 03</div>
                    <h3 class="serif-font text-navy">Reservation Details</h3>
                    <p class="text-muted">Capture essential guest information including their address and mobile number.</p>
                    <div class="img-frame">
                        <img src="images/11.png" alt="Search Screenshot">
                    </div>
                </section>

                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 04</div>
                    <h3 class="serif-font text-navy">Invoice Summary</h3>
                    <p class="text-muted">Review the guest name, room category, and stay period. Verify the Grand Total before proceeding.</p>
                    <div class="img-frame">
                        <img src="images/12.png" alt="Billing Screenshot">
                    </div>
                </section>

                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 05</div>
                    <h3 class="serif-font text-navy">Bill Generation</h3>
                    <p class="text-muted">Click the 'Print Invoice' button to open the system print dialog. Ensure the layout is set to Portrait.</p>
                    <div class="img-frame">
                        <img src="images/13.png" alt="Print Screenshot">
                    </div>
                </section>

                <section class="module-card p-4">
                    <div class="step-indicator">MODULE 06</div>
                    <h3 class="serif-font text-navy">Billing & Payment Reports</h3>
                    <p class="text-muted">Review the automated Invoice Summary by entering the guest's Reservation ID. The system will calculate the Grand Total Due in LKR.</p>
                    <div class="img-frame">
                        <img src="images/14.png" alt="Reports Screenshot">
                    </div>
                    <div class="mt-3 small text-primary"><i class="bi bi-lightbulb me-1"></i> Tip: Export these reports for weekly management meetings.</div>
                </section>
                
                 <section class="module-card p-4">
                    <div class="step-indicator">MODULE 07</div>
                    <h3 class="serif-font text-navy">Staff Logout</h3>
                    <p class="text-muted">Securely sign out of the staff panel after completing your tasks.</p>
                    <div class="img-frame">
                        <img src="images/15.png" alt="Logout Screenshot">
                    </div>
                </section>

            </div>

            <div class="col-lg-4">
                <div class="sticky-sidebar">
                    
                    <div class="sidebar-box mb-4">
                        <h5 class="serif-font border-bottom pb-2 mb-3"><i class="bi bi-clock-history text-warning me-2"></i>Stay Policies</h5>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted small">Check-In</span>
                            <span class="fw-bold small">02:00 PM</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted small">Check-Out</span>
                            <span class="fw-bold small">12:00 PM</span>
                        </div>
                    </div>

                    <div class="sidebar-box">
                        <h5 class="serif-font border-bottom pb-2 mb-4"><i class="bi bi-telephone text-warning me-2"></i>Direct Help</h5>
                        <a href="tel:+94766438754" class="contact-btn">
                            <i class="bi bi-phone text-gold"></i>
                            <div><div class="fw-bold small">Contact No</div><div class="text-muted small">+94 76 643 8754</div></div>
                        </a>
                        <a href="mailto:support@oceanview.lk" class="contact-btn">
                            <i class="bi bi-envelope text-primary"></i>
                            <div><div class="fw-bold small">Support Email</div><div class="text-muted small">info@oceanview.lk</div></div>
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <footer class="text-center">
        <div class="container">
            <h5 class="serif-font text-gold">Ocean View Resort Operations</h5>
            <div class="mt-2 opacity-50 small">&copy; 2026 Internal Control Module.</div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
AI for NTH Summer School - Offline Bundle
=========================================

This bundle contains the teaching environment needed for the summer school.

You do NOT need to install Python, conda, or Jupyter separately before using it.

----------------------------------------------------------------------
1. COPY THE BUNDLE TO A LOCAL WRITABLE FOLDER
----------------------------------------------------------------------

Please copy the entire AI_NTH_Bundle folder to a writable local directory.

Suggested locations:
- Windows:   C:\AI_NTH_2026- macOS:     ~/AI_NTH_2026/
- Linux:     ~/AI_NTH_2026/

IMPORTANT:
- Do NOT run the bundle directly from a USB stick.
- Do NOT place it in a read-only or protected folder.
- Keep the folder path simple if possible.

----------------------------------------------------------------------
2. START THE ENVIRONMENT
----------------------------------------------------------------------

Windows:
- Open the "environment" folder
- Double-click: start_jupyter_win.bat

Linux:
- Open a terminal
- Change into the bundle folder
- Run:
    ./environment/start_jupyter_linux.sh

Note:
If needed on macOS/Linux, first make the launcher executable:
    chmod +x environment/start_jupyter_linux.sh

----------------------------------------------------------------------
3. FIRST LAUNCH
----------------------------------------------------------------------

On first launch, the bundled Python environment will be unpacked locally under the environment folder.
This may take a few minutes.

Please wait until JupyterLab opens in your browser.

Later launches should be much faster.

----------------------------------------------------------------------
4. FIRST THING TO RUN
----------------------------------------------------------------------

After JupyterLab opens, please first run:

    environment/00_verify_environment.ipynb

This notebook checks that:
- the Python environment works,
- required packages import correctly,
- the datasets are accessible,
- and the teaching setup is ready.

----------------------------------------------------------------------
5. WHAT THIS BUNDLE CONTAINS
----------------------------------------------------------------------

- A portable Python environment with JupyterLab
- Course materials under course_materials/
- Required datasets under datasets/
- Verification notebook under environment/
- Launcher scripts under environment/

----------------------------------------------------------------------
6. IMPORTANT NOTES
----------------------------------------------------------------------

- This bundle is designed for offline use.
- Please do not move the "environment/portable_env" folder after first launch.
- If the first launch fails, delete the "environment/portable_env" folder and try again.
- If you still have problems, contact the organisers / TAs.

----------------------------------------------------------------------
7. TROUBLESHOOTING
----------------------------------------------------------------------

If JupyterLab does not start:

1. Check that the bundle was copied fully to local disk.
2. Check that there is enough free disk space.
3. Delete the "environment/portable_env" folder and run the launcher again.
4. Ask the organisers / TAs for support.

If you are using a company laptop with restrictions:
- local extraction may still work if the folder is writable,
- but some security software may block scripts or local servers.
If so, please contact the organisers.

----------------------------------------------------------------------
8. QUICK SUMMARY
----------------------------------------------------------------------

1. Copy the whole folder to local disk
2. Run the launcher script in environment/
3. Wait for first-time unpacking
4. Open and run:
   environment/00_verify_environment.ipynb

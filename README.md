# AI for Nuclear Thermal Hydraulics Summer School

This repository contains the public website, setup instructions, datasets, and hands-on course materials for the **AI for Nuclear Thermal Hydraulics Summer School**.

## Start Here As A Student

If you are preparing your laptop for the summer school, follow this order:

1. Read the [programme](https://ccp-nth.github.io/ai4nth-summer-school/programme.html) so you know what will be covered.
2. Go to `environment/` and follow `environment/README.md`. This is the main setup guide for participants.
3. Create and activate the Conda environment as described there.
4. Start JupyterLab and run `environment/00_environment_check.ipynb`.
5. If all environment checks pass, go to `course_materials/day0_onboarding/`.
6. Read `course_materials/day0_onboarding/README.md`.
7. Open and run `course_materials/day0_onboarding/Day0_self_learning_onboarding.ipynb`.
8. After Day 0, use the relevant day folder under `course_materials/` for later practical sessions.
9. Use files under `datasets/` only as directed by the notebooks or course team.

If the environment check or Day 0 notebook does not run successfully, contact the organisers before the course rather than spending too long debugging alone.

## Public Website

- [Summer school homepage](https://ccp-nth.github.io/ai4nth-summer-school/)
- [Programme](https://ccp-nth.github.io/ai4nth-summer-school/programme.html)
- [Registration](https://ccp-nth.github.io/ai4nth-summer-school/registration.html)
- [Contact](https://ccp-nth.github.io/ai4nth-summer-school/contact.html)
- [Teaching Materials](https://ccp-nth.github.io/ai4nth-summer-school/materials.html)

## Repository Map For Students

- `environment/` - setup instructions and the environment check notebook.
- `course_materials/` - day-by-day notebooks, slides, PDFs, and practical materials.
- `datasets/` - data files used by the notebooks.
- `website/` - source files for the public website.
- `assets/` and `_layouts/` - website support files.
- `instructors/` - lecturer-only templates and checklists; students do not need this folder.

The course is designed for standard laptops. If a notebook needs extra packages or non-standard software, that requirement should be documented in the relevant day folder.

## For Lecturers And Contributors

This section is for lecturers, organisers, and repository contributors. Students can normally stop at the student guidance above.

Lecturers should use the templates in `instructors/` when preparing materials:

- `instructors/lecturer_materials_checklist.md`
- `instructors/session_brief_template.md`
- `instructors/software_requirements_template.md`
- `instructors/practical_outputs_template.md`

Please add released teaching materials directly to the relevant day folder under `course_materials/` so students can see notebooks, slides, PDFs, and HTML tools in one place. Use `exercises/` and `solutions/` for structured practical tasks and reference outputs when those are needed.

Before submitting materials:

- Keep notebooks runnable on standard laptops.
- Avoid unnecessary package dependencies.
- Document extra software requirements in the session README or instructor template.
- Include expected practical outputs such as plots, metrics tables or saved artefacts.
- Flag likely student difficulties.
- State whether materials can be made public after the school.

Dataset contributions should go under `datasets/`. Do not add large datasets or files with unclear licensing. Add metadata, source, licence, target variable, feature descriptions and split information before release.

### How To Contribute Or Upload Materials

There are two normal ways to add material. Use the first route only if you are a repository maintainer; otherwise use the fork and pull request route.

**Maintainers with write access**

1. Create a new branch from the latest `main`, for example `materials/day2-tree-models` or `lecturer/your-name-session`.
2. Add or update files in the folders described below.
3. Commit the changes with a short, clear message.
4. Push the branch and open a pull request for review before merging into `main`.

**Contributors without write access**

1. Open the repository on GitHub and click **Fork**. This creates your own copy of the repository.
2. In your fork, create a new branch rather than editing `main` directly. Use a descriptive name such as `materials/day3-gp`.
3. Upload or edit your files in the correct folders. GitHub's web interface is fine for small uploads; use Git locally for larger changes.
4. Commit the changes in your fork.
5. Click **Contribute** or **New pull request** and choose `CCP-NTH/ai4nth-summer-school` as the target repository.
6. In the pull request description, say what you added, which day/session it belongs to, whether it is ready for public release, and whether it needs extra software or data.

Use this repository structure when adding new teaching content:

1. Choose the correct day folder in `course_materials/`.
2. Put released notebooks, slides, PDFs, and HTML tools directly in that day folder so students can find them easily.
3. Put separate student-facing exercise files in that day's `exercises/` folder when needed.
4. Put worked solutions or reference outputs in that day's `solutions/` folder only when they are approved for release.
5. Update that day's `README.md` with any special software, data, timing, or expected-output notes.
6. Put dataset files under `datasets/` only when release permissions and licences are clear. Update `datasets/chf_case_study/metadata.yaml` or add equivalent metadata for new datasets.
7. Use the templates in `instructors/` to describe the session, software requirements, expected lab outputs, and public-release status.

Before opening a pull request, check:

- Files are in the correct day folder.
- Notebook outputs do not contain private paths, credentials, or unnecessary large output.
- Any new package requirements are documented.
- Dataset source, licence, and release status are documented.
- Private or not-yet-approved material is clearly marked and not added to public release folders.

### Website Updates

Website source pages live in `website/`. The public URLs are controlled by each page's Jekyll `permalink` field, so source files can remain grouped while the website still publishes clean root-level links.

When updating the website:

- Edit the relevant Markdown file in `website/`.
- Keep navigation changes in `_layouts/default.html`.
- Keep images and CSS in `assets/`.
- Avoid moving existing public URLs unless redirects or permalink updates are also handled.

# Clover — setup in VS Code

## 1. Open on your laptop
1. Unzip `clover-website.zip`.
2. In VS Code choose File → Open Folder → `clover`.
3. Install the **Live Server** extension by Ritwick Dey from the VS Code Marketplace.
4. Right-click `index.html` → Open with Live Server.
5. Your browser opens the app. Do not double-click the HTML file: the skills library needs an HTTP server.

Alternative: with Python installed run `python3 -m http.server 5500` in this folder, then open http://localhost:5500.

No npm install or build is required. Edit `index.html`, `style.css`, `app.js`, and `skills.json` directly. Google Fonts supplies Fredoka for rounded display type, DM Sans for body text, and Caveat for handwritten accents; system sans-serif/cursive fonts are the fallbacks. Supabase's browser client loads from esm.sh only when configured.

## 2. Put it online for your phone
Use GitHub Pages:
1. Create a GitHub repository, e.g. `clover`.
2. Upload index.html, style.css, app.js, skills.json and clover-logo.png at the repository root. You may also upload the documentation; do not upload personal backups or credentials.
3. Repository Settings → Pages → Deploy from a branch → main → /(root) → Save.
4. Open the Pages URL GitHub provides on laptop and phone. Use this same URL consistently; changing origins creates separate local stores.
5. On iPhone use Safari → Share → Add to Home Screen. On Android use Chrome's Add to Home Screen / shortcut option. This is a responsive website shortcut, not an offline-installed app.

The app shell may be public on GitHub Pages, but your records and uploaded media are private under your Supabase account when the included SQL policies are installed. Local-only data stays in that browser. Anyone using an unlocked browser profile can see that profile's local records. Sign-out does not erase local data.

## 3. Enable private laptop ↔ phone sync
Without this step, devices do NOT share records or media.
1. Create a project at https://supabase.com. Review the current plan's storage, bandwidth and database limits, particularly for video.
2. Open SQL Editor → New query. Paste the entire `supabase.sql` file and run it **once** in the new project. This creates a private records table, private media bucket and per-account access policies.
3. In Supabase Authentication → URL Configuration, set Site URL to your GitHub Pages app URL. Add that URL to allowed redirect URLs. This is used for account confirmation.
4. In Supabase's project Connect/API settings, copy the **project URL** and **publishable key** (or legacy anon key). Never use a secret or service_role key in this app.
5. Open the app → Connection & backup. Paste URL and publishable key. Enter your email and a unique password (at least 8 characters), then Create account.
6. If email confirmation is enabled, confirm using the received email, then return and Sign in. For reliable production account mail, configure Supabase's SMTP according to their docs.
7. Wait for the header to say Synced. Existing local records and memory attachments upload automatically.
8. On your phone open the same website, enter the same project settings and **Sign in to the same account**. You should see your saved data. Use one Clover account across your own devices. Different accounts have isolated data; family-sharing accounts are not implemented.
9. A Sync now button is available. Sync also runs on edits, window focus, and every 30 seconds while the app is open. It needs internet access. Check the header for sync failures.

Use one device at a time when editing the same record. Records merge independently, but competing changes to the same profile, daily routine, or individual record use the last successful upload; there is no collaborative conflict editor. Keep device clocks accurate. Avoid switching accounts within a browser profile; the app binds a profile to its first signed-in account to avoid mixing records. Password reset can be handled by the Supabase administrator; an in-app reset workflow is not included.

## 4. Make it Clover's
- Profile → Edit profile: confirm birth/homecoming year, food, vet, emergency clinic, medications and older dog's details.
- Add confirmed care records: vaccine dates and vet-set next due dates, book-next-groom reminder, bathing, prevention and medication reviews. No vaccine schedule or medication dosage is assumed.
- Schedule → Edit daily routine changes the recurring template, with four columns separated by `|`. Skill IDs are in skills.json. Add a task for a one-day item or a daily recurring item. Task completion is stored separately by calendar date.
- Automatic milestones rotate in one eligible skill per day from nine weeks onward, alongside continuing foundations. The 54-skill library covers everyday puppy care, manners, safety, socialization, enrichment, independence and adolescent refreshers; outings are one goal among several.
- Memories supports multiple photos or videos per upload (each saved as a separate dated pin), maximum 40 MB. Select several items from Photo Library to add several pins on the same date. MP4/H.264 and JPEG are the most broadly compatible. Some browsers cannot display HEIC or MOV; convert them first if necessary.
- Toilet/sleep logs, a weight diary, expense entries in CAD, outing notes and independent older-dog rest periods are included.

## 5. Backup
Connection & backup → Export backup downloads JSON with records and locally available media. Before exporting, sign in, Sync now, then visit Memories to download remote attachments. Keep the file somewhere private. Restore through the same panel; imported records merge by ID and may overwrite matching records. A backup may be large because it includes media. Browser storage can be cleared or evicted; enable cloud sync and keep periodic backups.

## Practical limits
- Care reminders are visible in the app; there are no background alarms, calendar integrations or push notifications.
- Opening/reloading the website requires internet; there is no service-worker offline shell. Once loaded, local edits persist in IndexedDB and are retried on the next successful sync.
- No real backend account was provisioned for you. Authentication, database permissions, and cross-device/media sync must be checked against your configured project using the checklist below.
- Local browser QA checked loading, schedule quick views and practice logging; syntax checks also pass. Production backend integration was not tested with credentials.

## Quick setup check
1. Check off a schedule item, reload: it should remain checked for that date only.
2. Open a how-to, log a practice; search Skills and check its practice count.
3. Add a memory with an image; reload and reopen it.
4. Configure sync, sign in, and verify Synced. Sign in on your second device; confirm the item, practice count and memory appear there.
5. Add a care reminder and a fractional CAD expense; check the profile totals and schedule care panel.
6. Create a second test account in a separate browser profile: it must not see the first account's records or media.

Sources: https://avsab.org/resources/position-statements/ ; https://www.akc.org/expert-advice/puppy-information/introducing-puppies-to-senior-dogs/ ; https://vcahospitals.com/pediatric/puppy/behavior-training/when-to-start-puppy-training-classes ; https://supabase.com/docs/guides/storage/security/access-control . Care content uses reward-based practice; discuss safe early exposures, pickup age, food, vaccinations and grooming intervals with the relevant professionals.

## Updated schedule and memories
Before homecoming, the schedule is a preparation checklist; completed preparation carries forward. After homecoming, it uses the daily routine. Only the task at the current local time on today’s date has a yellow highlight; other dates have no time highlight. Small circles mark completion. The layout has separate time, task and notes columns. Memories uses a Pinterest-style masonry grid; use the date filter or Show all. Photos/videos are selected through the native device picker (Photo Library on iPhone), not a direct Photos-account integration. Original video formats are preserved; browser playback compatibility varies.

## Adaptive training schedule
Two short focus sessions (08:20 and 16:00) now use age, prerequisite skills and logged comfort instead of calendar rotation. Everyday care practice remains in the routine. In any skill pop-up, record Comfortable, Needed help, or Worried/overwhelmed, plus whether she met the displayed target and a note. Three comfortable success days at each step move Introduce → Consistency → One small change → Maintenance. Multiple sessions on one date count as one success day. Needing help clears the step’s success streak; worry moves back one step. Familiar skills become eligible for weekly maintenance; prerequisites unlock after the introductory step. Suggestions update after logging, including on the current schedule. Completing a schedule circle alone never advances skill progress. Older logs without comfort ratings remain in the history but do not establish readiness. Age dates are conservative starting suggestions, not deadlines or a diagnosis. You can skip any suggestion or practice another skill from the library. Future-date schedules reflect only the progress known for that date; they are not promises of future attainment.

The planner is a transparent rule-based aid based on your reports. It does not infer Clover’s feelings automatically. The three-day threshold is a product default, not a validated training protocol. The planner checks two focused skills per day; it does not prescribe doing every eligible skill at once.

## Skill ages, boundaries and gallery update
Skills are now grouped into suggested introduction windows: around 8 weeks, 9–10 weeks, 11–12 weeks, 13–16 weeks, and around 6 months onward. Search and category filtering preserve those groups. Age windows guide introductions; the adaptive schedule still uses readiness and prerequisites. The Gentle boundaries guide on Skills (also linked in each practice pop-up) gives practical prevent → interrupt → redirect → reward examples, with separate guidance for fear, guarding and pain.

Memory cards are now capped at 340 px wide, including when there is only one item. Photos and videos retain their aspect ratio and fit inside the card without cropping; media height is capped. Click a photo to open a larger, screen-fitted view. Videos play with controls inside their bounded cards. The updated design uses warm ivory, sage, blush details, serif headings and quieter navigation.

## Clover’s home setup
Her default routine now reflects bed-sharing at night, supervised freedom in your puppy-proofed bedroom while you work, and meals/rest in a downstairs pen with an open crate. Profile shows this home plan. Three new eight-week foundation guides cover pen settling, bedroom work time and bed-sharing bedtime (57 skills total). Crate practice remains voluntary/open by default, with separate brief closure practice for care/travel needs. Alone-time progression now uses pen comfort as its enclosure foundation.

Saved routine rows that still contain the app’s exact old default notes are automatically displayed with the new home-plan notes; customized notes and times are preserved. Review Edit daily routine if you previously customized these rows. Arrange bed-sharing to prevent falls, gaps, unsafe jumping and entrapment; use a nearby safe sleep space if you cannot make the shared bed safe. Plan responsive overnight toilet trips. Bedroom freedom requires supervision and puppy-proofing; focused work may require a smaller gated safe area. Meals in the pen remain separate from the older dog.

Further reading: https://vcahospitals.com/know-your-pet/house-training-your-puppy ; https://vcahospitals.com/know-your-pet/crate-training-your-dog ; https://www.aaha.org/resources/what-to-do-when-you-first-bring-home-a-new-puppy/

## Field-journal redesign with the original rounded font
The layout now uses a large date composition, a seven-day navigation strip, a daily notes rail with homecoming countdown or current learning focus, an age-grouped numbered skill catalogue, and a scrapbook-style bounded photo gallery. Fredoka from the first design is restored for headings and dates; there are no angular display fonts or contrasting serif italics. Handwritten accents are used sparingly. Current-time yellow highlighting, the adaptive planner, home setup, and saved data remain supported. Countdown and age arithmetic now use calendar-day rounding to avoid daylight-saving off-by-one errors.

Validation for this revision: JavaScript syntax and adaptive-planner checks passed; browser inspection confirmed the schedule, date-strip navigation and rounded typography. Live cloud authentication/sync and physical phone layouts were not re-tested.

## Reference-based print / collage design
The latest revision replaces the sentimental copy and green journal styling with blue-on-paper, red handwritten notes, cut-paper accents and the rounded Fredoka font. Memories is a bounded, unframed contact-sheet collage; photos still open in a screen-fitted view. Reference images were used for design direction, not inserted as fake dog memories.

Schedule has Day and Week buttons. Day retains tasks, notes and quick practice guides. Week shows a Monday–Sunday calendar with colored start-time blocks for meals, rest, training and care/practice. Click a block for notes and its practice guide, or open that date in Day view. Block heights are display markers, not prescribed durations. Scheduled starts between 07:00 and 23:00 appear in Week; use Day to see custom overnight tasks. Toilet needs remain flexible. Pre-arrival dates link to the shared preparation checklist; these are not timed appointments. On a phone, the week calendar scrolls horizontally to preserve readable columns. Your Day/Week preference is saved on each device.

Validation: syntax and adaptive-planner checks pass; browser testing covered Day/Week switching, a post-homecoming week, opening a training block and its practice guide. Backend integration and physical mobile devices were not tested in this design revision.

## Clean reference layout and new palette (current design)
The current design supersedes earlier visual descriptions. The daily schedule returns to the first supplied layout: one large month/day heading, age on the right, and full-width time/task/notes rows. Daily view is the default for this redesign; Week remains available. Only the current task on today’s date uses the pale-canary highlight. Secondary routine/log controls are under More, and care reminders/daily logs are in a collapsible section. Stickers, decorative side panels, handwriting, repeated slogans, numbered navigation and extra top labels have been removed.

Palette: Pale Canary #FDFE9D; Nepal #96A6C5; Moon Glow #FEFEDB; Dark Burgundy #6F060D; Deep Moon #243253. Moon Glow is the background, Deep Moon is the primary text, Burgundy is the restrained navigation/action accent, and Nepal is used for muted details. The original rounded Fredoka font is retained.

The skills library uses collapsible age groups; search or category filters open matching groups. Memories retains small proportionate images and video controls, with a larger photo view on click. All existing care, progress and media records remain compatible. Browser checks covered the simplified daily layout and grouped skill disclosure; syntax and planner checks passed. No new live backend or physical-phone testing was done.

## Latest: photo-stack home and dated care
Home now has an overlapping, hover-lift photo collage inspired by the Zohar Family landing page. Use Add photos on Home to upload images; each also becomes a memory. Manage photos opens Memories, where Edit lets you change date/title/notes or remove an image from the home collage without deleting it. The collage shows up to 18 recent featured images; videos remain in Memories. Hover or keyboard-focus lifts a photo; tap/click opens it. The background is now August-reference beige (#e7e4dd). Until photos are added, an empty collage prompt appears; no sample personal photos or test records are included in the ZIP.

Scroll down on Home or click Daily schedule to reach the schedule. Click a skill’s task title or its how-to link for practice instructions. Navigation is Home, Skills, Memories, Profile. The outing preparation page is still reachable from Skills.

New memories record both the chosen memory date and the actual added timestamp. Memories displays the added date and any notes. Older entries have no historical creation timestamp and explicitly say the added date is unavailable; the app does not invent one. Videos and images can still be selected from the native phone library, up to 40 MB each.

Date-specific care tasks now appear directly in the daily and weekly schedule: add them under More → Schedule care, or enter a next date in Profile’s care records. Set the date/time and an optional repeat interval in whole days. Click Reschedule to postpone to another date; moving it preserves the record and a move history. Completing a care task asks for the actual completion date and next due date; it suggests the next date using any repeat interval, which you can change. Completion remains in the dated history. Overdue items also appear on today’s schedule. Bath/grooming timing should reflect your vet/groomer’s advice; vaccine and medication schedules use the instructions you enter rather than invented dates.

No database schema update is needed for existing configured projects. Keep the same website address/origin to retain local data. Syntax and adaptive-planner checks passed; local browser tests verified creating a dated bath task and postponing it from November 9 to November 10. The photo-picker test was interrupted, so full upload/hover behaviour and physical-device testing remain unverified. Live cloud sync was not tested with a configured account.

## Borderless photo album update (latest)
Photo borders, frame padding and shadows are removed from the landing collage. Hover/focus still lifts the photo, while its full aspect ratio is preserved. Clover’s wordmark at the top left is now green (#365448).

Memory title and event date are optional both when adding and editing. You may upload photos/video without either. An automatically recorded added timestamp remains separate. An empty entry must contain at least media, a title or a note. Existing memories remain compatible.

Memories is now a continuous monthly album: dated entries group by their event month; entries with no event date group by their actual added month; older entries with neither are under Undated. On desktop, each month is a shared photo spread. On small screens, swipe horizontally through the month’s album, then scroll down for earlier months. Full images are fitted without cropping or borders; videos retain inline controls. Notes and the automatically added date sit beneath media. Photos still open larger on tap/click.

Validation: JavaScript syntax and adaptive-planner checks passed. Browser testing confirmed an untitled, undated note can be saved and appears under the added month. Mobile CSS includes swipe snapping, proportionate photo sizing and larger touch controls; physical-phone testing and a complete native photo-picker upload remain unverified. Preview-only test records are not included in this ZIP.


Latest album update: Memories uses a compact, date-grouped photo grid, with three columns on phones. Tap any thumbnail to view the full photo or video, optional title, event date, notes and added date, or edit/delete it. Undated memories group by their added date when available. Grid previews crop to squares; opened media preserves its full proportions. Home collage photos remain borderless with restored soft shadows. Physical phone testing has not been performed.

Media viewer update: opening photos/videos now shows only the media and a translucent title/date overlay at its top. Missing optional fields are hidden. Notes and added-date text do not appear over media. Note-only entries open their editor.

If you still see a beige memory panel with Edit/Delete, replace index.html, app.js and style.css together from this ZIP. Reload with Cmd+Shift+R on Mac (Ctrl+Shift+R on Windows). Keep the same website address/port to retain browser-local memories. This release versions script/style requests to prevent stale asset reuse.


Profile documents: Add PDFs, Word, Excel, TXT, CSV, RTF or ODT files (40 MB each), plus optional labels, dates and notes. PDFs have an in-app preview and download fallback; other formats download to open with a suitable app. Documents use the same private account storage and local backup as memories. For an EXISTING Supabase project, run documents-update.sql once in SQL Editor to allow these file types. New projects use the updated supabase.sql. Sync across devices requires signing into the same configured account. Cloud integration has not been tested against a live project.

Memory navigation: use the on-image previous/next buttons or Left/Right arrow keys. Navigation follows the current album date filter and skips note-only entries. Video controls retain their normal arrow-key seeking when the video itself has focus. Heading accents are now warm brown.

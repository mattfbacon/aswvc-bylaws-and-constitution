// TODO Consider changing the numbering scheme for sections, clauses, subsections, etc, to just be flat numbering, or maybe something like (1.a.i.)+. For the moment this change is active, but we do need to consider whether we want it.

#let font-size = 12pt
#let line-height = 0.7em

#set page(paper: "us-letter", margin: 1in)
#set text(font: ("Times New Roman", "Liberation Serif"), size: font-size)
#set par(leading: line-height, linebreaks: "optimized")
#show par: set block(spacing: line-height)
#set grid(gutter: line-height)

#show heading: it => align(center, it)
#show heading.where(level: 2): set block(above: 2em)
#show heading: it => text(size: font-size, it)

#let enum-nest-to-string(l) = numbering("1.1a.i.1", ..l).trim()
#let enum-nest-counter = state("enum-nest")
#let enum-numberings = ("1.", "a.", "i.", "1.")
#show enum: it => enum-nest-counter.display(nest => block(inset: (left: if nest.len() > 1 { 2em } else { 0em }, rest: 0pt), spacing: 0pt, {
	for (i, child) in it.children.enumerate(start: 1) {
		block(spacing: line-height, {
			{
				show heading: none
				heading(level: nest.len() + 2, enum-nest-to-string(nest + (i,)))
			}
			[*#numbering(enum-numberings.at(nest.len() - 1), i)* ]
			enum-nest-counter.update(v => v + (i,))
			child.body
			enum-nest-counter.update(v => v.slice(0, -1))
		})
	}
}))

#show ref: it => locate(loc => {
	let ref-label = it.target
	let ref-loc = query(ref-label, loc).first().location()
	let num = enum-nest-counter.at(ref-loc)
	link(ref-label, enum-nest-to-string(num))
})

#let article-counter = counter(<article>)
#article-counter.step()
#let article(i, name) = [
	#article-counter.update(v => { assert.eq(i, v, message: "Please fix the numbering for Article " + str(v) + ", " + str(name) + ", which is currently numbered incorrectly as Article " + str(i)); v })
	#article-counter.display(v => [
		#enum-nest-counter.update((v,))
		== #[ARTICLE #numbering("I", v) (#v)\ #text(weight: "regular", underline(name)) <article>]
	])
]
#show heading.where(level: 1): it => {
	article-counter.update(1)
	it
}

= Constitution of the Associated Students of West Valley College

== Preamble

We the students of West Valley College, in order to form an efficient, representative student government, to encourage greater student participation in the governance of West Valley College and the West Valley--Mission Community College District, to promote and direct those student activities which stimulate the intellectual, physical, and social life of our college, and to improve relations within the college community; do hereby establish this constitution and assume the powers and duties of self-government pursuant to policies of the Board of Trustees of the West Valley--Mission Community College District as authorized in Section 7606D of the California Educational Code.

#article(1, "Name")

+ The name of this organization shall be the Associated Students of West Valley College (ASWVC).

#article(2, "Conduct")

+ This organization and/or its members, while functioning as representatives of the ASWVC and/or the College shall be committed to a policy of non-discrimination, specifically, the ASWVC shall be not for profit, non-partisan, and the ASWVC shall be in compliance with West Valley--Mission Community College District Board policies regarding equal opportunity at all times.

#article(3, "Bylaws")

+ The bylaws of this Constitution shall be the lawful means whereby the purposes and principles of this Constitution shall be implemented.

#article(4, "Rules of Order")

+ Except as explicitly provided to the contrary in this constitution and its bylaws, the most current edition of Robert’s Rules of Order shall govern the procedures of the ASWVC.

#article(5, "Membership")

+ All registered students of West Valley College, whom have paid the Student Representation Fee or have had the aforementioned fee waived, shall be members of ASWVC and shall be entitled to all the privileges and rights thereof.

#article(6, "Organization")

+ The ASWVC will comprise an Executive Board and a Student Senate.
+ The ASWVC Executive Board shall consist of a President, Vice President, six (6) Directors, and a Student Trustee.
+ The requirements to hold office within the ASWVC shall be enumerated in the Bylaws of this constitution.
+ All ASWVC Executive Board members and Student Senate members must be elected into office, as outlined within the Bylaws of this constitution.

#article(7, "Constitutional Amendments")

+ This Constitution may be amended by referendum from the Student Senate in a special Election submitted to the ASWVC Senate, provided that:
	+ Constitutional amendments shall be publicly posted and announced in a regular meeting of the ASWVC Senate, as outlined in the bylaws of this constitution, for at least fourteen (14) consecutive calendar days immediately prior to the election.
	+ Adoption of amendments to this Constitution shall require two-thirds (2/3) favorable vote of those legal ballots cast in an election of the ASWVC.
		+ A legal ballot shall be defined as a physical or electronic document that includes a form of identification—used to prevent miscount of the votes—as well as the voting members declaration of either yea or nay for the proposed amendment.
			+ Said legal ballot must be easily accessible for one (1) year after the voting process to future Executive Board Members for the purpose of record keeping
		+ Voting may be conducted through a physical document created by the ASWVC Executive Board
		+ Voting may be conducted through electronic means
		+ A student may only vote once (1), either yea or nay, for the proposed constitutional amendment.
	+ The voting period on the suggested constitutional amendment shall remain open for a minimum of ten (10) days.
	+ Adoption of amendments to this constitution shall be effective immediately upon certification of the election results by the ASWVC Advisor.

== Constitutional Amendment Log

#grid(columns: (8em, 1fr), row-gutter: 2 * line-height,
[January 1984],[Adoption of Constitution],
[August 1993],["treasure" typo corrected],
[December 1994],[Name Change, ASBWVC to ASWVC],
[December 1994],[Article VI, Section 1, Clause 1, 10% changed to 5% 12/94 Rules of Order change Sturgis to Roberts],
[September 2007],[Constitution Retyped],
[April 2016],[Name Changed from Associated Student Organization to Associate Student of West Valley College (ASWVC), Positions within ASWVC redefined, and Constitution Retyped],
[March 2023],[Article I, Associated Students at West Valley College changed to Associated Students of West Valley College \
Article VI, Section 2, The ASWVC Executive Board shall consist of a President, three (3) Vice Presidents, and a Student Trustee changed to The ASWVC Executive Board shall consist of a President, Vice President, six (6) Directors, and a Student Trustee. \
Article VII, Section 1, Clause 1, Constitutional amendments shall be publicly posted, as outlined in the bylaws of this constitution for at least fourteen (14) consecutive calendar days immediately prior to the election changed to Constitutional amendments shall be publicly posted and announced in a regular meeting of the ASWVC Senate, as outlined in the bylaws of this constitution, for at least fourteen (14) consecutive calendar days immediately prior to the election. \
Article VII, Section 1, Clause 2, Section 1 added. \
Article VII, Section 1, Clause 2, Section 1, Subsection A added. \
Article VII, Section 1, Clause 2, Section 2 added. \
Article VII, Section 1, Clause 2, Section 3 added. \
Article VII, Section 1, Clause 2, Section 4 added.],
[October 2023],[Retyped],
)

#pagebreak(weak: true)

= Bylaws of the\ Associated Students of West Valley College

#article(1, "Legal Statutes")

+ All senate business shall be conducted in accordance with the Brown Act. This includes, but is not limited to: all meetings, all notices, all agendas and the rights of the public.

#article(2, "Membership")

+ Members of the Associated Students of West Valley College (ASWVC) are outlined in Article V Section I of the ASWVC Constitution.
+ Non-voting (Ex Officio) members of the ASWVC shall include but not be limited to the ASWVC Advisor.

#article(3, "Executive Board")

+ The Executive Board consists of the ASWVC President, Vice President, Director of Finance, Director of Marketing, Director of Records, Director of Student Engagement, Director of External Operations, Director of Club Relations, and a Student Trustee.
+ The Executive Board’s term of office shall end on the last day of the Spring Semester.
	The newly elected Executive Board shall assume office on the following academic day of Summer Session.
	+ With the exception of the Student Trustee, whose term shall begin and end in accordance with the Board of Trustees.

#article(4, "Meetings")
+ For guidelines on parliamentary procedure, ASWVC will use Robert's Rules of Order in all meetings, except in the cases where these bylaws or other special rules conflict, or Robert’s Rules are suspended as shown in Article IV Section 2.
+ These rules may be suspended by article and section by a two-thirds (2/3) majority vote of the voting members present.
+ Suspension of rules shall apply only to the meeting during which the vote was taken.
+ The regular ASWVC Senate meetings will be held on Tuesdays and as written in the agenda of the previous meeting, commencing the first week of the semester and ending the week prior to finals.
+ The regular ASWVC Executive Board meetings will be held on Thursdays and as written in the agenda of the previous meeting, commencing the first week of the semester and ending the week prior to finals.
// TODO this implies that committee meetings count as "regular meetings", which entails a lot of other requirements throughout the bylaws. We should make sure that these entailed requirements are all intended to apply to committee meetings rather than just the main Senate meetings. Also, the wording is a bit unclear because we mention "Regular meetings of the ASWVC excluding committee meetings" but then we also say "Regular meetings of the ASWVC Senate". Is there a difference? If not, we should use one for al uses here.
+ All regular meetings of the ASWVC, excluding committee meetings, shall be held at 3:45 p.m. throughout the academic year and given ample (72 hours) notification in accordance with the Brown Act.
	+ This time can be changed with two-thirds (2/3) favorable vote of the ASWVC, provided there are no conflicts with the College’s schedule.
	+ Any regular meeting still in session after two (2) hours of the day on which it began shall immediately adjourn, unless the ASWVC extends the meeting (for a specified amount of time) by a two thirds (2/3) favorable vote of the members present and voting.
	+ Regular meetings of the ASWVC Senate shall not be held during Summer Session and Winter Session of West Valley College.
+ Meeting Norms
	// TODO clarify what "formally" means here.
	+ Each speaker shall be formally recognized by the acting Chairperson.
	+ Debate on each item being considered by the Senate shall be limited to fifteen (15) minutes unless otherwise specified by a motion that is passed by a majority vote.
	// TODO this is never done. remove?
	+ Debate shall be extended ten (10) minutes at a time.
	// TODO what are "personnel matters"? Clarify this. Also, does this mean the meeting MUST be closed if considering personnel matters, or just that it MUST be open if not? We could possibly use "if and only if" to clarify.
	+ Meetings of the ASWVC shall be open to the general public. Meetings shall be closed to the public only when personnel matters are being considered.
	// TODO redundant with Robert's rules?
	+ All legislation presented to the Senate shall be presented on the floor of the Senate, with the reading of the legislation to be followed by a motion and a second for the adoption of the legislation.
+ Meeting Agendas and Minutes
	// TODO Reference Brown Act
	+ Items to be placed on the agenda shall be submitted to the appropriate Chairperson at least 72 hours prior to the meeting.
	+ All ASWVC meeting minutes will be made available to the public within 72 hours prior to the next meeting.
	// TODO make into a section called Quorum with one subsection for definition and another for requirement
+ Quorum must be established to take vote on any items, which is defined as 51% of active members with voting rights.
+ Special or emergency meetings may be called by any ASWVC Executive Officer or by a majority of the currently voting Senators.
	+ A special or emergency meeting can only be called in accordance with the Brown Act and must follow all Brown Act requirements.
	// TODO only class? what about other pre-existing commitments?
	+ If an Officer or Senator has class at the time of the special or emergency meeting, the student will be excused with no repercussion for attendance for regularly scheduled meetings.
	+ All special or emergency meetings must be presided in the same manner as regular meetings.

#article(5, "Voting Rights")

+ Senate voting privileges are limited to ASWVC Senators, Director of Finance, Director of Marketing, Director of Records, Director of Student Engagement, Director of External Operations, Director of Club Relations, and the Student Trustee.
	// TODO is this Vice President or Chairperson?
	+ The ASWVC Vice President can vote only in the event of a tie.
	+ The ASWVC President has the power of veto, but has no vote in the Senate.
+ Executive Board voting privileges are limited to the ASWVC Vice President, Director of Finance, Director of Marketing, Director of Records, Director of Student Engagement, Director of External Operations, Director of Club Relations, and the Student Trustee.
	+ The ASWVC President can vote only in the event of a tie.
	+ As a voting member of the ASWVC Senate, any Senators running for candidacy in an ASWVC Vacancy Process maintain the right to vote for themselves when presented to the ASWVC Senate for a roll call vote.
+ All voting members maintain the right to only vote once (1).

// TODO Reorganize. Most of this should not be under the GPA section.
#article(6, "Requirements for Executive Board Officers")

+ Grade Point Average (GPA) Requirements
	+ All Executive Board members must have a 2.0 cumulative GPA and maintain a 2.0 GPA during their time in Office.
	+ New students to West Valley College without any completed units will have the GPA requirement waived until their first completed semester.
	+ All officers must be enrolled in five (5) or more units at the time of their election and during their time in office or they will be automatically removed at the next regular ASWVC meeting.
	+ All Executive Board members must remain in good standing with the West Valley College Student Code of Conduct, as well as all West Valley College Campus Policies and West Valley College Board Policies.
		+ If a candidate in a regular ASWVC Election or ASWVC Vacancy Process is in violation of the West Valley College Student Code of Conduct, their candidacy may be immediately removed.
		// TODO may or must?
		+ If an Executive Board member is in violation of the West Valley College Student Code of Conduct, they may be immediately removed from office.
	+ All Executive Board members must be in consistent attendance and have no existing scheduling conflicts with all regular ASWVC Senate meetings and ASWVC Executive Board meetings throughout the entirety of the academic school year.

#article(7, "ASWVC Executive Board Officers Accountability")

+ Conditions of Office
	// TODO major oopsie!! so executive board members are not senators??
	+ No student may hold more than one permanent ASWVC position, unless circumstances deem it "urgent and necessary," with a two-thirds (2/3) favorable vote of the Senate.
	+ A student may not be elected or appointed to the same Executive Board position for more than two (2) consecutive years.
	+ A student may not serve on the Executive Board for more than three (3) years within a five (5) year period.
	// TODO does this have an impact on anything? Everything else says "years", not "terms".
	+ For purposes of determining eligibility to continue in office, an officer who has served more than half a term is considered to have served a full term.
+ Absences and Tardiness for ASWVC-Sponsored Meetings and Events
	// TODO why would a senator need an excused absence for an event?
	+ For an excused absence, the ASWVC Senator or ASWVC Executive Board member must give adequate notice of being absent or be absent for an emergency or medical reason.
		+ Adequate notice shall be defined as notifying the respective meeting Chair 72 hours in advance of the meeting at which the ASWVC Senator or ASWVC Executive Board member cannot be in attendance.
		// TODO Reorganize. Most of this should really just be under 3, not 3a. Or reorganize more generally.
		// TODO What happens if the VP has to miss the senate meeting, or the president the executive board meeting?
		+ If an Executive Board Officer is unable to attend an event for a non-emergency related matter such as a schedule conflict, the Executive Board Officer shall communicate that absence to the ASWVC President 72 hours in advance. This shall be considered an excused absence.
		+ If an Executive Board Officer is unable to attend a Senate or Committee Meeting, they shall communicate their absence 72 hours in advance to the Vice President.
		+ If an Executive Board Officer is unable to attend an Executive Board Meeting, they shall communicate their absence 72 hours in advance to the President.
		+ All other absences shall be considered unexcused.
	+ In the event that the Officer has had five (5) unexcused absences, it is recommended that the Executive Board submit a “Vote of No Confidence” to the ASWVC Senate for that Executive Board Officer.
		+ Two (2) instances of tardiness shall equal (1) unexcused absence. For the purpose of calculating absences, tardiness is defined as arriving after the roll call or after the posted start time of an ASWVC-Sponsored Event.
		+ Two (2) excused absences shall equal (1) unexcused absence.
	+ Paid Hours
		+ All ASWVC officers shall post and hold a minimum of three (3) “Office Hours” per week on behalf of the students that must be spent in their ASWVC office.
		// TODO why would they post their work hours??
		+ All ASWVC officers shall post and hold a minimum of three (3) “Work Hours” per week that must be spent on West Valley College’s Campus.
		+ Three (3) instances of an officer failing to hold these hours, as posted, shall equal one (1) absence, unless excused by the President (or the Presiding Officer if the President is not available).
	+ The President, Vice President, Director of Student Engagement, and Director of Records shall keep a public record of all unexcused and excused absences for Executive Board Officers.

#article(8, "Executive Board Election Process")

// TODO do the other members require designees if they are also running for positions?
// TODO should the members of this committee be allowed to vote in the election?
// TODO add a section to restrict and codify the allowed language in election ballot entries. For example, should candidates be allowed to include endorsements from previous Executive Board members?
+ The Election Committee shall be composed of the President (or designee if the current President is running for a position), the ASWVC Advisor, Director of Marketing, Director of Records, Director of Student Engagement, Director of External Operations, Director of Club Relations, and two Senate members who are not running for elected office.
	+ The purpose of this committee will be to plan and communicate the election timeline, provide platforms for candidates to campaign to the student body, and ensure compliance with the rules outlined in this article and fair election procedures in general.
+ Prospective candidates must submit an application for consideration by the Election Committee by the specified deadline.
	+ Notification of officer position openings is to be provided to all students and shall contain the following: position title, description of the job, term of office, deadline for the application, phone number, address or building number for further information, and requirements for the position.
	// TODO limit by how long? And does this delay the election of the other officials, if multiple are being elected?
	+ In the event that there are no applications submitted, the Election Committee may extend the application deadline for that position.
	+ A student may apply for only one position during an election process.
+ Committee members shall consider all applications as private and confidential information during the formal screening process. Discussion of a candidate's information shall remain confidential between the committee and the said candidate.
+ The ASWVC Advisor shall retain all applications for one academic year, after which they may be destroyed.
+ The election process, including a public notice of those elected, shall be completed three (3) weeks prior to the end of the academic year. The election process shall begin anytime after ten (10) weeks prior to the end of the academic year.
+ The application for candidacy shall be open for a minimum of ten (10) days. The voting for candidates shall take place for seven (7) days.
+ Elections will be conducted among all currently enrolled West Valley Students.
+ Elections may be conducted via electronic software.
// TODO(amendment) add a section about voting systems... I would love to use Ranked Choice..
// TODO ensure that the vote is confidential.

#article(9, "Vacancies in the Executive Board")

// TODO change from majority vote to ranked choice.
+ If a position, other than President, is vacated for any reason, the ASWVC Senate shall fill the position by a majority vote.
	+ In the event of an absence in the office of the President, the line of succession shall be as follows: Vice President, Director of Finance, Director of Student Engagement, Director of Marketing, Director of Records, Director of External Operations, Director of Club Relations, Student Trustee.
	+ All vacancies shall be posted for a minimum of seven (7) days, in the same manner as the ASWVC meeting agendas.
+ To apply, students shall submit an application for the open position.
	+ Before being appointed, candidates must be interviewed by the Executive Board at an Executive Board meeting.
	+ The Executive Board will then forward two candidates to face off in a regular meeting of the ASWVC Senate for consideration.
		+ In the event that only one student applies for any position, the Executive Board may put forth only one candidate to the Senate.
		+ Regardless of the number of candidates forwarded, the options for consideration shall include "No Confidence".
	// TODO ensure that the vote is confidential.
	+ The successor to any position vacated will be appointed by a majority of the Senate.
	+ Any position filled by the Senate shall be for the remaining period of office in said term.

#article(10, "Vote of No Confidence")

+ Grounds for removal of office of a Senator or Executive Board Officer shall be limited to malfeasance, misfeasance, and nonfeasance.
// TODO who is the College Conduct Officer??
+ If a Senator or Executive Board officer has been found in violation of the Student Code of Conduct, they may be immediately removed by the College Conduct Officer without a Vote of No Confidence.
+ Removal of Senators and Executive Officers by a Vote of No Confidence
	+ Any member of the Senate with active voting rights has the right to request a Vote of No Confidence.
	+ The subject of a Vote of No Confidence is limited to Senators and Executive Board Officers.
	+ The request for a Vote of No Confidence must be lodged in an open, regularly scheduled meeting of the Senate.
		// TODO the requirement about voting member is already stated. No need to repeat it. Also, what if that section was removed?
		+ A Vote of No Confidence shall be requested by a voting member of the Senate under Public Comments.
	// TODO why?
	+ The Vote of No Confidence shall be taken at the next scheduled meeting after the initial request.
	// TODO fix very weird phrasing.
	+ A two-thirds (2/3) vote of the Senate members present and voting shall be necessary to qualify as a "Vote of No Confidence."
		// TODO who else would it be put forth against?? 10.3b already says it only applies to senators and E-board officers.
		+ Should the Vote of No Confidence be put forth against a voting member of the ASWVC Senate or the ASWVC Executive Board, that individual does not retain the right to vote in their own Vote of No Confidence.
	+ A Vote of No Confidence shall result in removal of office and loss of voting rights.
	// TODO but it is subject to a veto by the Advisor? If so, clarify here, and possibly remove the next item.
	+ A Vote of No Confidence is not subject to a presidential veto.
	// TODO and then what can the advisor do? Veto it?
	+ Any subject of a successful Vote of No Confidence has the right to appeal to the ASWVC Advisor within five (5) business days.

#article(11, "Committees")
// TODO expand into an entire section about Ad Hoc committees. Also, probably move to the end of the article.
+ The Vice President shall have the ability to appoint individuals to any Ad Hoc committees.
+ The Bylaws Committee shall be composed of the Vice President and at least three additional Senate members. The Director of Records or their designee shall serve as an Ex-Officio member of the committee for minute recording purposes.
	+ The Vice President shall serve as the Chairperson or assign a designee to do so.
	+ The Bylaws Committee shall certify that the ASWVC Bylaws are applicable and up to date.
	+ The Bylaws Committee shall meet at least every two weeks while the ASWVC Senate is active.
+ The Budget and Finance Committee shall be composed of the Director of Finance, and at least three additional Senate members. The Director of Records or their designee shall serve as an Ex-Officio member of the committee for minute recording purposes.
	+ The Director of Finance shall serve as the Chairperson or assign a designee to do so.
	+ The Budget and Finance Committee shall certify the ASWVC Financial Code is enforced and up to date, reviewing budget proposals, and reviewing purchases made by the ASWVC.
	+ The Budget and Finance Committee shall meet at least every two weeks while the ASWVC Senate is active.
+ The Outreach Committee is to be a standing internal committee of the ASWVC and be composed of the Director of Marketing and at least three additional Senate Members. The Director of Records or their designee shall serve as an Ex-Officio member of the committee for minute recording purposes.
	+ The Director of Marketing shall serve as the Chairperson or assign a designee to do so.
	+ The Outreach Committee shall create and execute marketing plans for ASWVC-sponsored Events.
	+ The Outreach Committee shall meet at least every two weeks while the ASWVC Senate is active.
+ The Activities Committee is to be a standing internal committee of the ASWVC and be composed of the Director of Student Engagement, Director of External Operations, and three additional Senate Members. The Director of Records or their designee shall serve as an Ex-Officio member of the committee for minute recording purposes.
	+ The Director of Student Engagement shall serve as the Chairperson or assign a designee to do so.
	+ The Activities Committee shall brainstorm and schedule events for the ASWVC to host.
	+ The Activities Committee shall meet at least every two weeks while the ASWVC Senate is active.
// TODO what does this actually mean? Doesn't the bylaws committee only make proposals to the senate?
+ In the event of a dispute, the Bylaws Committee shall determine the interpretation of the ASWVC Constitution and Bylaws.
	+ If the Bylaws Committee is not set to convene for a regularly scheduled committee meeting within five (5) business days, then the committee shall be required to convene for an emergency meeting within that period in order to resolve the dispute.
	// TODO clarify what the final resolution is and how that is tied back to the senate.
	+ The Bylaws Committee shall define the premise for the directive in question and consider suggestions made by attending members at said meeting to resolve the dispute.


#article(12, "Senator Requirements")
// TODO did we ever give the requirement that this sign-in is provided? We may want to make this less specific, too.
// TODO "at the beginning" meaning before approval of agenda and minutes? I'm not sure but I thought we do Appointments at the end of the first section.
// TODO clarify that certain meetings don't count for this.
+ Any student who is currently registered for credit at West Valley College, has passed the Parliamentary Procedure test, and has attended and signed in as a guest on the Senate Meeting Guest Sign-In Sheet for two (2) Senate Meetings will be granted voting rights at the beginning of the student’s third Senate meeting. <to-become-senator>
+ Any Senator who has two (2) consecutive unexcused absences for regularly scheduled Senate meetings of ASWVC will have all rights and privileges, including voting, automatically suspended. All rights and privileges will be reinstated at the beginning of the student’s second consecutive regularly scheduled Senate meeting.
	+ Attendance is defined as being present for at least 100% of the meeting or 1.25 hours, whichever is shorter.
	// TODO(external) have we ever tracked this at all? senators arrive late all the time
	// TODO would this "call to order must be ..." sentence be better somewhere else?
	+ Two (2) instances of tardiness shall equal (1) unexcused absence.
		+ For the purpose of calculating absences, tardiness is defined as arriving five (5) minutes after the predetermined meeting time. Call to order must take place at most five (5) minutes after the predetermined meeting time.
	// TODO may?
	+ Two (2) or more consecutive unexcused absences may be considered as nonfeasance.
	// TODO "give notice at least 72 hours in advance". Also, split into two sentences.
	+ For an excused absence, senators must give notice at least 72 hours in advance. With less than 72 hours of notice, absence can only be excused in cases of emergency.
		+ Status of absence (excused or unexcused) is subject to approval.
+ Senators shall serve on at least one (1) internal committee, external committee, or ad-hoc committee at all times during the academic year, as such committees become available.
	+ Senators shall serve on various committees as appointed by the ASWVC Vice President.
		+ There is no regulatory limit on the number of committees that a Senator can be a member of.
	// TODO what does this actually mean?
	+ Senators shall be an active member of their committee.
	// TODO voting rights in the committee or in the senate?
	// TODO this seems like it should be multiple points.
	+ Senators deemed inactive in a committee by the majority of the Executive Board may have privileges and voting rights suspended or be removed from the Senate. Attendance and tardiness in committee meetings will be considered the same as senate meetings. Two (2) unexcused absences will result in a removal of voting rights. For the purposes of counting attendance, two (2) tardinesses will be considered an unexcused absence.
	+ Senators must make at least two committee reports at a regular Senate meeting per semester.
	+ Members of the Senate who serve as chairs of ASWVC internal committees shall be exempt from making at least two committee reports at a regular Senate meeting per semester.
// TODO why is this necessary when we have an absence system already?
+ Senators shall be an active member at ASWVC regular Senate meetings for the duration of the semester.
	+ To qualify as an active Senator at the end of a semester, a Senator must attend at least 51% of ASWVC Senate meetings.
// TODO should the sentences after the first be subsections?
+ Senators have the right to request an excused leave of absence for up to one semester without penalty.
	+ Senators must request the leave of absence before the first Senate meeting of the semester in question with details of the conflict and submit it in writing to the ASWVC Executive Board.
	+ Requests must be reviewed by the ASWVC Executive Board before becoming active.
	+ An excused leave of absence is allowed for up to one semester.
	+ Any Senate meetings missed before the request for a leave of absence will be counted against the Senator’s attendance record.
	+ Senators who miss two consecutive semesters will be required to repeat the steps laid out in @to-become-senator to be re-granted voting rights.
	+ Should a Senator require a leave of absence after the first Senate meeting has passed, they should contact the current Vice President and decide upon further action.

#article(13, "Student Organizations and Funding Requests")
+ A student organization is any organization that organizes around a stated, legal, and authorized purpose.
+ Each student organization must consist of a President, three (3) additional student officers, and a faculty advisor to be recognized as an organization eligible for funding and other benefits from the ASWVC.
+ Proposed student organizations must register with West Valley College through an online or physical process prior to being eligible for funding or other benefits from ASWVC. This process is repeated each semester.
+ Campus Entity Funding
	+ The ASWVC will entertain funding request for uses that will improve the student experience. Entities that may request funding include but are not limited to recognized clubs, students, student organizations, campus programs, departments and divisions of West Valley College, and staff, faculty and administration.
	+ Funding requests must not exceed the allotted amount in the ASWVC Budget set by the Advisor and Director of Finance.
		+ If the funding request exceeds the allotted amount, the budget may be amended to allocate additional funds for funding requests in general.
	+ All funding of entities on campus by the ASWVC must be approved in a Budget and Finance committee meeting before being put forth to the Senate.
		+ The campus entity requesting funding must submit an agenda request to the ASWVC Director of Finance seventy-two (72) hours before a regular committee meeting for any action to be taken on the funding request.
			+ The campus entity must include in the agenda request a description of the purpose for which funding is needed as well as the dollar amount of funding needed.
		+ A representative of the campus entity may attend and give a detailed report of proposed spending for each endeavor to the committee.
			+ Student organizations must include in the detailed report of proposed spending the goods or services that need to be purchased, proof of the scheduled future event or endeavor, and an explanation of the dollar amount requested as it relates to the goods or services needed. Failure to include these items will result in an automatic denial of the funding request.
	// TODO this should say just "funding requests" not specifically club funding requests. This section in general is too focused on *club* funding requests.
	+ The Senate shall have the final deciding vote to approve or reject club funding requests and will vote on any funding requests approved by the Budget and Finance committee at a regular meeting of the Senate.
		// TODO change "must" to "may", and possibly add a section which would require club officers to meet with the Director of Club Engagement at least once a month for funding.
		// TODO add a section which requires people who want to create clubs to meet with the Director of Club Engagement. This might replace the requirement for clubs to have an advisor, or we could say that the Director of Club Engagement would be the "pseudo-advisor" of that club.
		+ A representative of the campus entity must attend and give a detailed report of proposed spending for each endeavor at a regular meeting of the Senate under the standing action item, Club Funding Requests, prior to spending the funds requested.
			// TODO Must be approved, not just voted on. 🤓
			+ All funding requests must be discussed and voted on in this standing Senate item to be considered allocated.
			+ Campus entities must include in the detailed report of proposed spending the goods or services that need to be purchased, proof of the scheduled future event or endeavor, and an explanation of the dollar amount requested as it relates to the goods or services needed. Failure to include these items will result in an automatic denial of the funding request.
	// TODO phrasing is very unclear
	+ Campus entities must share a student attendance list with the ASWVC Director of Finance following each endeavor at which ASWVC funds shall be used specifically for reimbursements.
		+ Campus entities must submit proof of the endeavor’s occurrence, such as an event flyer, to the ASWVC Director of Finance in order to receive reimbursements.
	+ Campus entities must provide additional information as requested by the ASWVC Director of Finance or the ASWVC Advisor when spending or requesting any and all funds or receiving reimbursements.
	// TODO how are fundraising endeavors related?
	+ Each entity capable of receiving funding shall start each semester with zero dollars (\$0) in allotted funding, with funds to be added on a rolling basis based on ASWVC approval or fundraising endeavors.
+ Student Organization Fundraisers
	+ All fundraising proposals must be approved by the ASWVC Advisor.
		+ A student organization representative must meet with and give a detailed report of the fundraising endeavour to the ASWVC Advisor.
		+ Student organizations must submit proof of the fundraising endeavor’s occurrence to the ASWVC Advisor.
		+ The ASWVC Advisor may deny any and all fundraising requests that are not equitable or allowed on the college campus at their discretion.
// TODO what is "sanctioned"??
+ If it becomes apparent that any sanctioned student organization is failing to fulfill its stated objectives or obligations, a two-thirds (2/3) majority vote of the Senate present and voting may revoke the funding.

// TODO make ordering of "Serve on the executive board" and "Give a report at each regular meeting" items consistent between entries.
// TODO clarify requirements for designees.
#article(14, "Executive Board Responsibilities")
+ Duties and Responsibilities by Office
	// TODO standardize the formatting of these sections. Items immediately under the role should be imperative, while nested items should be normal sentences.
	+ President
		+ Act as the Chief Executive Officer and official spokesperson of the ASWVC.
		+ Serve as the Chairperson of the Executive Board.
		+ Have the power to veto legislative actions of the ASWVC.
			+ The President must exercise the option of veto within seven (7) days of the action by ASWVC.
			+ The veto must be put on display as a public notice in the same manner as Senate meeting agendas for at least one week.
			+ The veto may be overridden by a two-thirds (2/3) favorable vote of the voting membership of the ASWVC at a regular scheduled meeting within the next two (2) regular meetings following the posting and transmission of the veto.
		+ Appoint temporary replacements for any vacancies, until a permanent replacement can be appointed.
			+ Temporary replacements shall last six (6) weeks, or until the next ASWC Senate meeting, whichever is longer in duration. A permanent appointment shall be appointed by the end of this duration.
		+ Serve as an Ex-Officio member on all ASWVC internal Committees.
		+ Represent the ASWVC at the West Valley--Mission Community College District Board of Trustees meetings, or delegate a representative from the ASWVC.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Attend, represent, and vote on behalf of ASWVC at all SSCCC Region IV Meetings or assign a designee to do so.
		// TODO not grammatical. What is this supposed to say? It's not clear.
		+ Give monthly reports of SSCCC of the California Community College meetings and business.
		+ Act as liaison between local, state, and federal government and the ASWVC.
		+ Inform the ASWVC of all government legislation that pertains to WVC.
		+ Establish frequent communication with district administration.
		+ Establish frequent communication with West Valley College students, faculty, and administration.
		+ Coordinate with Student Services consistently throughout the year to discuss ASWVC activities and events.
		+ Serve as the ASWVC representative to College Council or designate an ASWVC delegate.
		+ Serve on the Graduation Committee or assign a designee to do so.
		+ Serve on the Career & Internship Readiness Week Committee or assign a designee to do so.
		+ Hold ASWVC Executive Board Officers accountable to the following requirements: <eboard-requirements>
			+ Ten (10) hours of on-campus time dedicated to ASWVC activities
			+ Attendance at all ASWVC-sponsored events
			+ Attendance at all appropriate Executive Board, Senate, and Committee Meetings
		+ Coordinate appropriate disciplinary actions with ASWVC Advisor and appropriate Executive Board Member if @eboard-requirements requirements are not followed.
		// TODO Are they only allowed to assign a designee if they are running for office?
		+ Serve as Chairperson for the Elections Committee or assign a designee to do so if running for office for the following academic year.
		// TODO what about misfeasance and nonfeasance?
		+ Hold all Executive Board Members accountable to their responsibilities and recommend appropriate disciplinary action for any malfeasance.
		+ Hold regularly scheduled meetings with appropriate Executive Board Members.
		+ Review and approve event responsibilities assigned by the Director of Student Engagement to the Executive Board prior to events.
		+ Represent the ASWVC at West Valley--Mission District Council meetings or assign a designee to do so.
	+ Vice President
		+ Perform the duties of the President in the event of their absence, disability, or removal from the office.
		// TODO what about a designee?
		+ Serve as the Chairperson of the ASWVC Senate.
		+ Serve on the Executive Board of the ASWVC.
		+ Enforce all rules, regulations, and procedures passed by the ASWVC and/or stated in the ASWVC Constitution and Bylaws.
		// TODO isn't this more of a Director of Records thing? Pretty sure Charity does this now...
		+ Maintain a record of all Senators with active voting rights.
		+ Have the authority to delegate duties and responsibilities to all Senators.
		// TODO ...as with anything else presented to the senate. Seems redundant
		+ Bring forth amendments to the ASWVC Constitution and Bylaws to the attention of the ASWVC Senate as needed.
		// TODO only for those purposes?
		+ Form and dissolve committees, organizations, and associations for specific purposes to conform to the bylaws contained herein.
		+ Have authority to appoint Senators to help with programs, events, or any other ASWVC business.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Attend, represent, and vote on ASWVC's behalf at all SSCCC Region IV Meetings as the alternate delegate or appoint a designee to do so.
	+ Student Trustee
		+ Inform the ASWVC of all actions of the West Valley--Mission Community College District Board of Trustees.
		+ Serve on the Executive Board of the ASWVC.
		// TODO no excused absences?
		+ Attend all West Valley--Mission Community College District Board of Trustees meetings.
		// TODO this is subject to recognition by the chair. Maybe it should be rephrased.
		+ Announce appropriate West Valley--Mission Community College District Board of Trustees agenda items to the ASWVC.
		// TODO as with every officer and elected official in general. Redundant?
		+ Be responsible and accountable to the students of the district and their elected officers.
		// TODO as with any officer and even any senator? Redundant?
		+ Make themselves informed about issues that have a direct or significant impact on students of the district or that are brought to the attention of the Student Trustee by any concerned students.
		// TODO what? Is this office hours? Or Senate meetings? Very weird.
		+ Gather student input and disseminate information by meeting at least once per month, school calendar permitting, at a scheduled meeting of the student government organization at their respective College and in other ways as appropriate.
		+ Be subject to recall in the manner prescribed by the procedures established by the Board of Trustees.
		// TODO wrong phrasing. And "their external committee" implies that every officer (or every member of some other arbitrary group) must have an external committee.
		+ Their external committee shall be the Board of Trustees meetings.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Represent the ASWVC at West Valley--Mission District Council meetings or assign a designee to do so.
	+ Director of Finance
		+ Serve as Chairperson of the Budget and Finance Committee.
		+ Perform and enforce all procedures outlined in the ASWVC Financial Code.
		+ Serve on the Executive Board of the ASWVC.
		+ Maintain the account for all ASWVC money on a day-to-day basis.
		+ Submit a comprehensive monthly report of income, expenses, and state of reserves and progress of the budget of the ASWVC to the ASWVC Advisor.
		+ Give a report every regular Senate meeting to the ASWVC of ASWVC financial status.
		+ Keep records of decisions made in meetings.
		+ Coordinate records with the ASWVC Advisor.
		+ Submit all check requests and reimbursements.
		+ Give a report to the ASWVC at every regular Senate meeting.
	+ Director of Marketing
		+ Facilitate communication between students and the ASWVC.
		+ Serve as a member of the Executive Board of the ASWVC.
		+ Keep students up to date on all issues affecting the campus community.
		+ Produce a current monthly calendar of events and post the aforementioned calendar in a way that is easily and readily accessible to ASWVC student officers and West Valley students.
		+ Provide weekly updates on events and legislation to the student body via ASWVC social media accounts.
		+ Create and post flyers and advertisements.
			+ All flyers and advertisements for an event should be prepared for distribution before the event is held.
		+ Serve as the Chairperson of the Outreach Committee.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Abide by the ASWVC Marketing Standards and Procedures.
	+ Director of Records
		// TODO what does authenticated mean?
		// TODO what are standing rules and orders?
		+ Maintain all ASWVC records including agendas, minutes, committee records, an authenticated copy of the ASWVC Constitution, Bylaws, Codes, and all standing rules and orders of the ASWVC and ensure that said documents are available for reference and public inspection at all times.
		+ Serve as a member of the Executive Board of the ASWVC.
		+ Serve as an Ex-Officio member of all ASWVC internal committee meetings for record-keeping purposes.
		+ Perform the recording, written and by device, of the minutes of all ASWVC meetings. In the event of their absence, the presiding officer shall appoint a member of the ASWVC to take minutes for the duration of that meeting.
		+ Be responsible for ensuring that the minutes of the previous meeting of the ASWVC are available to the public at least seventy two (72) hours prior to the next scheduled meeting.
		// TODO if we use this git-based solution, we will have to train the Director of Records in its usage. The GitHub workflow at least simplifies the generation of the PDF.
		+ Update the ASWVC Constitution, Bylaws, Marketing Standards and Procedures, and Financial Code to reflect changes made in the Senate and by the student body.
		+ Coordinate updates to the ASWVC Constitution, Bylaws, and Financial Codes to West Valley College’s Information Services to reflect changes on the website.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Attend all ASWVC internal committee meetings for minute-taking purposes or assign designees to do so as necessary.
	+ Director of Student Engagement
		+ Serve as Chairperson for all Activities Committee meetings.
		+ Serve on the Executive Board of the ASWVC.
		+ Attend all ASWVC-sponsored events throughout the academic year.
		+ Function as project manager, overlooking and coordinating all student-run campus activities.
		+ Create and maintain an event calendar for each semester within one week before each semester begins.
		+ Keep students up to date on all events affecting the campus community.
		+ Provide updates on events to the Director of Marketing.
		+ Coordinate all setup and takedown procedures for campus events.
		+ Coordinate all volunteers at campus events.
		// TODO should this say "shall be present"?
		+ Maintain a schedule of which Executive Board officers are present at each ASWVC-sponsored event.
		+ Communicate responsibilities of Executive Board Members for ASWVC-sponsored events to the Executive Board seventy-two (72) hours in advance of the Event.
			+ Event responsibilities must be reviewed by the ASWVC President.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Ensure that the ASWVC is hosting no fewer than two (2) ASWVC-sponsored events per month.
	+ Director of External Operations
		+ Serve on the Executive Board of the ASWVC.
		+ Research and contact outside vendors for campus events.
		+ Work with the Director of Student Engagement on the planning process for events.
		// TODO who is the fiscal assistant?
		+ Facilitate payments with ASWVC Fiscal Assistant to vendors for campus events.
		+ Coordinate insurance policy for the use of external vendors for campus events.
		+ Serve as an Ex-Officio member on the Activities Committee.
		+ Give a report to the ASWVC at every regular Senate meeting.
	+ Director of Club Relations
		+ Serve on the Executive Board of the ASWVC.
		+ Serve as the official ASWVC representative to all clubs on campus.
		+ Give a report to the ASWVC at every regular Senate meeting.
		+ Remain in contact with all active clubs to consistently provide updates and any other relevant information which regards the ASWVC and clubs.
		+ Keep a record of all active clubs.
		+ Serve as a liaison between clubs and ASWVC.
		+ Plan and hold at least one club fair per semester.
		+ Supply clubs with opportunities to promote their organization throughout the academic year.
		+ Incorporate club participation in ASWVC events should the event include an opportunity for clubs to promote their organization and gain membership.
		+ Communicate with clubs to keep the student body informed of any opportunities to participate in club activities, meetings, or other business.
	+ Student Senator
		+ Represent the student body by being the voice of West Valley College students to the ASWVC.
		// TODO what is formal action
		+ Carry out all duties and responsibilities as delegated to them through formal action of committees and/or by direction of the Executive Board.
		+ Vote on all matters brought up in ASWVC Student Senate meetings in order to foster positive change for all West Valley College students.
+ General Executive Board Responsibilities
	+ All Executive Board Members shall serve on the ASWVC Senate and follow appropriate procedures to become an active Senate Member.
		// TODO does this mean that people who are elected to the E-board who were not previously senators to have to take the test? We should clarify that.
		+ Executive Board members are not subject to take the Parliamentary Procedure Test if they have previously done so as an active Senator.
	+ All Executive Board members are required to attend two-thirds (2/3) of all ASWVC-sponsored events, with the exception of the ASWVC Director of Student Engagement, who must be present at all ASWVC-sponsored events.
		+ Executive Board Members shall attend the setup and cleanup portions of events, as well as perform any respective roles at the event.
		+ Executive Board Members must be present for two-thirds (2/3) of the event to be considered in attendance at the respective event.
		+ A minimum of five (5) Executive Board members must be present at such ASWVC-sponsored events.
	// TODO excused absences?
	+ All Executive Board Members are required to attend all ASWVC Senate Meetings and ASWVC Executive Board Meetings.
	+ The Chairperson of a meeting shall be responsible for the creation of agendas for that meeting.

#article(15, "Financial Code")
+ The usage and distribution of ASWVC funds shall be subject to a governing document known as the ASWVC Financial Code.
	// TODO this means we also need to typst-ify the financial code
	+ The ASWVC Financial Code shall be made publicly available in the same manner as the ASWVC Constitution and Bylaws.
+ The language of the ASWVC Financial Code shall be enacted, rescinded, or amended by a two-thirds (2/3) vote of the active ASWVC members with voting rights.
	+ Such proposals shall be submitted as an agenda request to the ASWVC Executive Board at least 24 hours prior to the Agenda posting requirements for the meeting at which they will be voted upon.
// TODO changes to the financial code, not bylaws
+ Adoption of the changes to the bylaws shall become effective immediately following a two-thirds (2/3) favorable vote of the Senate.
// TODO is this more suited for the E-Board Responsibilities article?
+ The Director of Finance, along with the ASWVC Budget and Finance Committee, shall certify that the ASWVC Financial Code is enforced and up to date.

#article(16, "Article of Changes")
+ These bylaws shall be enacted, rescinded, or amended by a two-thirds (2/3) vote of the ASWVC Senate.
+ Such proposals shall be submitted as an agenda request to the ASWVC Executive Board at least 24 hours prior to the Agenda posting requirements for the meeting at which they will be voted upon.
// TODO "ed petition" ??
// TODO why? the bylaws only govern the ASWVC; why should non-associated students be able to edit them?
+ These bylaws may also be enacted, rescinded, or amended by ed petition of ten percent (10%) of the members of the Student Body.
+ Adoption of the changes to the bylaws shall become effective immediately following a two-thirds (2/3) favorable vote of the ASWVC or upon certification of the required features on the aforementioned petition.
+ ASWVC Advisor, along with the Vice President, shall bear the responsibility of certifying the validity of the aforementioned petition.


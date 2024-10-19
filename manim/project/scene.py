from manim import *

class SquaresAnimation(Scene):
    def construct(self):
        title = Text("What happens to our graduates?", font_size=36)
        title.to_edge(UP, buff=0.5)
        self.play(Write(title))
        # Create 9 squares in a row
        squares = VGroup(*[Square(side_length=0.8, fill_opacity=0.8) for _ in range(9)])
        squares.arrange(RIGHT, buff=0.3)
        self.play(Create(squares))
        self.wait(1)

        # Transform one square into a smiley face
        smiley = Circle(radius=0.4, color=YELLOW, fill_opacity=0.8)
        eyes = VGroup(
            Dot(point=[-0.15, 0.1, 0], radius=0.05),
            Dot(point=[0.15, 0.1, 0], radius=0.05)
        )
        happy_mouth = ArcBetweenPoints([-0.2, -0.1, 0], [0.2, -0.1, 0], angle= PI/2)
       
        smiley_face = VGroup(smiley, eyes, happy_mouth).move_to(squares[4])
        self.play(Transform(squares[4], smiley_face))


        sad_mouth = ArcBetweenPoints([-0.2, -0.1, 0], [0.2, -0.1, 0], angle= -PI/2)

        sad_face5 = VGroup(smiley, eyes, sad_mouth).move_to(squares[5])
        self.play(Transform(squares[5], sad_face5))
        self.wait(1)

        sad_face6 = VGroup(smiley, eyes, sad_mouth).move_to(squares[6])
        self.play(Transform(squares[6], sad_face6))
        self.wait(1)

        sad_face7 = VGroup(smiley, eyes, sad_mouth).move_to(squares[7])
        self.play(Transform(squares[7], sad_face7))
        self.wait(1)

        sad_face8 = VGroup(smiley, eyes, sad_mouth).move_to(squares[8])
        self.play(Transform(squares[8], sad_face8))
        self.wait(1)

        # Move one square to the right and exit the scene
        self.play(squares[8].animate.shift(RIGHT * 3))
        self.remove(squares[8])
        self.play(squares[7].animate.shift(DOWN * 3))
        self.remove(squares[7])
        self.play(squares[6].animate.shift(UP * 3))
        self.remove(squares[6])
        self.play(squares[5].animate.shift(LEFT * 8))
        self.remove(squares[5])
        self.wait(1)

        # Transform four squares into question marks
        question_marks = VGroup(*[Text("?", font_size=36) for _ in range(4)])
        for i, mark in enumerate(question_marks):
            mark.move_to(squares[i])

        self.play(
            Transform(squares[0], question_marks[0]),
            Transform(squares[1], question_marks[1]),
            Transform(squares[2], question_marks[2]),
            Transform(squares[3], question_marks[3])
        )
        self.wait(2)

if __name__ == "__main__":
    scene = SquaresAnimation()
    scene.render()



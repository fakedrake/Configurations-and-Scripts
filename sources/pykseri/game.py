from random import shuffle
from functools import wraps

def show_played(f):
    @wraps(f)
    def new(*args, **kwargs):
        card = f(*args,**kwargs)
        print args[0].ID,"plays",card
        return card
    return new



class Deck(list):
    def __init__(self):
        super(Deck,self).__init__()
        self.figures = [str(x) for x in range(1,11)]
        self.figures[0] = 'A'
        self.figures += ['J', 'Q', 'K']
        self.colors = ['S', 'D', 'C', 'H']
        for i in self.figures:
            self += [i+x for x in self.colors]

    def shuffle(self):
        self = shuffle(self)

    def distribute(self, players):
        if len(self) == 0:
            return False

        if len(players) * 7 > len(self):
            i = 0
            while len(self)>0:
                players[i] += [self.pop()]
                i=(i+1)%len(players)

        for i in players:
            i+=self[-7:]
            del self[-7:]

        return True


class Player(list):
    """an AI player, overload to make a human"""

    def __init__(self, ID = 0):
        super(Player,self).__init__()
        self.owned = []
        self.kseres = []
        self.ID = ID

    @show_played
    def play(self,cards):
        """cards are the cards down
        ADD CARD TO DOWN BEFORE YOU TAKE THEM ALL"""


        if len(self) == 0:
            return ""

        #found the card down in self and remove it(move to owned)
        try:    #there might be no cards down
            for i in range(len(self)):
                if self[i][0] == cards[-1][0]:
                    cards+=[self[i]]
                    del self[i]
                    self.owned += cards[:]
                    if len(cards) == 2:
                        self.kseres += self.owned.pop()
                    print "Taken:",cards
                    del cards[:]
                    return cards.past[-1]
        except:
            pass

        #if you have  a jack and there are more than the mean cards that were down
        for i in range(len(self)):

            if self[i][0] == 'J':
                x = 0
                for y in cards.sizes:
                    x+=y
                try:
                    x/=len(cards.sizes)
                except:
                    x=2
                if len(cards) > x:
                    cards += [self[i]]
                    del self[i]
                    self.owned += cards[:]
                    print "Taken:",cards
                    del cards[:]
                    return cards.past[-1]

        #play the figure most seen so far
        max = 0
        ind = 0
        for i in range(len(self)):
            tmp = cards.count(i) + cards.past.count(i)
            if tmp > max:
                ind = i
                max = tmp
        cards += [self[ind]]
        del self[ind]
        return cards[-1]

class HPlayer(Player):
    @show_played
    def play(self,cards):
        if len(self) == 0:
            return ""


        print "card down is:"
        if len(cards) == 0:
            print "[]"
        else:
            print cards[-1],"(over",len(cards)-1,"cards)"
        print "Your cards are:",self
        card = ""
        while (not (card in self)) and card != "QUIT":
            card = str.upper(raw_input(self.ID+": Enter card name you want to play: "))

        cards += [self[self.index(card)]]
        del self[self.index(card)]
        try:
            if card[0] == cards[-2][0]:
                self.owned += cards
                print "You took:",cards
                del cards[:]
            return cards.past[-1]
        except:
            pass
        return cards[-1]

class Down(list):
    def __init__(self, card = None):
        super(Down,self).__init__()
        if not card is None:
            self += [card]
        self.past = []
        self.sizes = []

    def __delitem__(self,a):
        self.past += [self[a]]
        super(Down,self).__delitem__(a)

    def __delslice__(self,i,j):
        self.past += self[i:j]
        self.sizes += [len(self[i:j])]
        super(Down,self).__delslice__(i,j)


from itertools import cycle

if __name__ == "__main__":
    deck = Deck()
    deck.shuffle()

    field = Down()

    players = [Player(1), Player(2), Player(3), HPlayer("you")]

    print "The game begins!!"

    while deck.distribute(players):
        for i in cycle(players):
            if i.play(field) == "":
                break

    print "Scores:"
    for i in players:
        print len(i.owned)+9*i.kseres
